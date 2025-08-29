import type { LayoutServerLoad } from './$types';
import { redirect } from '@sveltejs/kit';

export const load: LayoutServerLoad = async ({ url, locals }) => {
  const user = locals.user;

  if (url.pathname === '/admin/login') {
    if (user) throw redirect(302, '/admin'); // already logged in
    return { user: null };
  }

  // all other /admin pages must be logged in
  if (!user) throw redirect(302, '/admin/login');

  return { user };
};
