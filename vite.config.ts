import tailwindcss from '@tailwindcss/vite';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	base: "/maid-agency-website/",
	plugins: [tailwindcss(), sveltekit()],
});
