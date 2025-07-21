-- Initial database schema for Expo Clerk Supabase Starter

-- Function to get user ID from JWT
CREATE OR REPLACE FUNCTION get_user_id()
RETURNS TEXT AS $$
  SELECT nullif(current_setting('request.jwt.claims', true)::json->>'sub', '')::TEXT;
$$ LANGUAGE sql STABLE;

-- Create profiles table
CREATE TABLE public.profiles (
  id TEXT PRIMARY KEY,  -- Clerk's user ID
  first_name TEXT,
  last_name TEXT,
  preferred_currency TEXT NOT NULL DEFAULT 'USD',
  email TEXT UNIQUE,  -- Unique constraint on email
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Create an index on email for faster lookups
CREATE INDEX idx_profiles_email ON public.profiles (email);

-- Enable Row Level Security
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Trigger function for updated_at
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to update timestamp
CREATE TRIGGER handle_profiles_updated_at
BEFORE UPDATE ON public.profiles
FOR EACH ROW
EXECUTE FUNCTION public.handle_updated_at();

-- Policy for viewing own profile
CREATE POLICY "Users can view their own profile" 
ON public.profiles FOR SELECT 
USING (id = get_user_id());

-- Policy for inserting a profile (only for the authenticated user)
CREATE POLICY "Users can insert their own profile" 
ON public.profiles FOR INSERT 
WITH CHECK (id = get_user_id());

-- Policy for updating own profile
CREATE POLICY "Users can update their own profile" 
ON public.profiles FOR UPDATE 
USING (id = get_user_id());

-- Policy for deleting own profile
CREATE POLICY "Users can delete their own profile" 
ON public.profiles FOR DELETE 
USING (id = get_user_id());
