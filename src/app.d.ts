// See https://svelte.dev/docs/kit/types#app.d.ts
// for information about these interfaces
declare global {
	namespace App {
		interface Locals {
      		user: {
        		id: number;
        		username: string;
     		} | null;
      		session: import('$lib/server/auth').SessionValidationResult['session'];
    }
	} // interface Error {}
	// interface Locals {}
} // interface PageData {}
// interface PageState {}

// interface Platform {}
export {};
