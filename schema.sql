-- Run this in Supabase SQL Editor. Enables per-user row-level security.
create table if not exists public.transactions (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 kind text not null check (kind in ('expense','income')),
 amount numeric(12,2) not null check (amount > 0),
 category text not null,
 record_date date not null default current_date,
 note text,
 created_at timestamptz not null default now()
);
alter table public.transactions enable row level security;
drop policy if exists "Users can read their own transactions" on public.transactions;
create policy "Users can read their own transactions" on public.transactions for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert their own transactions" on public.transactions;
create policy "Users can insert their own transactions" on public.transactions for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update their own transactions" on public.transactions;
create policy "Users can update their own transactions" on public.transactions for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Users can delete their own transactions" on public.transactions;
create policy "Users can delete their own transactions" on public.transactions for delete to authenticated using (auth.uid() = user_id);
grant select, insert, update, delete on public.transactions to authenticated;
