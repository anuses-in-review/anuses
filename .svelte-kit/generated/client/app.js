export { matchers } from './matchers.js';

export const nodes = [
	() => import('./nodes/0'),
	() => import('./nodes/1'),
	() => import('./nodes/2'),
	() => import('./nodes/3'),
	() => import('./nodes/4'),
	() => import('./nodes/5'),
	() => import('./nodes/6'),
	() => import('./nodes/7'),
	() => import('./nodes/8'),
	() => import('./nodes/9')
];

export const server_loads = [];

export const dictionary = {
		"/(full-website)": [3,[2]],
		"/(full-website)/guess-who-board-list": [5,[2]],
		"/(full-website)/guess-who-selector-1": [6,[2]],
		"/(full-website)/guess-who-selector-list": [7,[2]],
		"/(full-website)/guess-who": [4,[2]],
		"/(full-website)/loteria": [8,[2]],
		"/(full-website)/most-recent": [9,[2]]
	};

export const hooks = {
	handleError: (({ error }) => { console.error(error) }),
};

export { default as root } from '../root.svelte';