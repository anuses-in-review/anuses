import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/kit/vite';

const dev = process.argv.includes('dev');

export default {
    preprocess: vitePreprocess(),

    kit: {
        adapter: adapter({
            // Optionally specify additional options for the adapter
            // For example, you can specify the output directory
            // output: 'build' // Output directory for the static files (default is 'build')
        }),

        paths: {
            // Use BASE_PATH environment variable in production
            base: dev ? '' : process.env.BASE_PATH,
        }
    }
};
