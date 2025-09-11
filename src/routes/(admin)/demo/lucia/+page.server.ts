import * as auth from '$lib/server/lucia';
import { fail, redirect, type RequestEvent } from '@sveltejs/kit';
import { getRequestEvent } from '$app/server';
import type { Actions, PageServerLoad, RouteParams } from './$types';

export const load: PageServerLoad = async () => {
	const user = requireLogin()
	return { user };
};

export const actions: Actions = {
	logout: async (event) => {
		if (!event.locals.session) {
			return fail(401);
		}
		await auth.invalidateSession(event.locals.session.id);

		return redirect(302, '/demo/lucia/login');
	},
};

function requireLogin() {
  const { locals } = getRequestEvent();

  if (!locals.user) {
    return redirect(302, "/demo/lucia/login");
  }

  return locals.user;
}
