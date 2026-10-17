-- Ejecuta este script en Supabase SQL Editor.
create extension if not exists pgcrypto;
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  role text not null default 'cliente' check (role in ('cliente','admin')),
  created_at timestamptz not null default now()
);
create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete set null,
  customer_name text not null,
  customer_email text not null,
  items jsonb not null,
  total numeric(10,2) not null check (total >= 0),
  status text not null default 'nuevo' check (status in ('nuevo','leido','preparacion','listo','cerrado','cancelado')),
  hubspot_deal_id text,
  created_at timestamptz not null default now()
);
alter table public.profiles enable row level security;
alter table public.orders enable row level security;
create policy "Users read own profile" on public.profiles for select to authenticated using (id = auth.uid());
create policy "Users update own name" on public.profiles for update to authenticated using (id = auth.uid()) with check (id = auth.uid());
create policy "Customers read own orders" on public.orders for select to authenticated using (user_id = auth.uid());
create policy "Customers create own orders" on public.orders for insert to authenticated with check (user_id = auth.uid());
-- Para administrar pedidos, crea una policy adicional limitada a un rol admin
-- comprobado en profiles; nunca confíes en un rol enviado desde el navegador.
-- No habilites UPDATE público ni expongas service_role key en el frontend.
