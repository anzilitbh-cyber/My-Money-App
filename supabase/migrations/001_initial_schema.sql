
-- MY MONEY: Initial database schema

create table if not exists public.profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  base_currency text not null default 'BHD',
  created_at timestamptz not null default now()
);

create table if not exists public.transactions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  transaction_date date not null default current_date,
  transaction_type text not null,
  category text,
  description text,
  amount numeric(14,3) not null check (amount > 0),
  currency text not null default 'BHD',
  payment_method text,
  notes text,
  created_at timestamptz not null default now()
);

create table if not exists public.debts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  creditor text not null,
  description text,
  original_amount numeric(14,3) not null default 0,
  outstanding_amount numeric(14,3) not null default 0,
  currency text not null default 'BHD',
  interest_rate numeric(7,3),
  due_date date,
  status text not null default 'active',
  notes text,
  created_at timestamptz not null default now()
);

create table if not exists public.receivables (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  person text not null,
  description text,
  original_amount numeric(14,3) not null default 0,
  outstanding_amount numeric(14,3) not null default 0,
  currency text not null default 'BHD',
  due_date date,
  status text not null default 'pending',
  notes text,
  created_at timestamptz not null default now()
);

-- Enable row-level security
alter table public.profiles enable row level security;
alter table public.transactions enable row level security;
alter table public.debts enable row level security;
alter table public.receivables enable row level security;

-- Give authenticated users access only to their own records
create policy "Users manage own profile"
on public.profiles
for all to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users manage own transactions"
on public.transactions
for all to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users manage own debts"
on public.debts
for all to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users manage own receivables"
on public.receivables
for all to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

-- Helpful indexes
create index if not exists transactions_user_date_idx
on public.transactions (user_id, transaction_date);

create index if not exists debts_user_idx
on public.debts (user_id);

create index if not exists receivables_user_idx
on public.receivables (user_id);

