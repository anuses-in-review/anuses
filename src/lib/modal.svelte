<script lang="ts">
    import "$lib/styles.css";
    import Xit from "$lib/x.svelte";
	export let showModal: boolean; // boolean
	let dialog: HTMLDialogElement; // HTMLDialogElement
	$: if (dialog && showModal) dialog.showModal();
</script>

<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
<dialog
	bind:this={dialog}
	on:close={() => (showModal = false)}
	on:click|self={() => dialog.close()}
>
	<!-- svelte-ignore a11y-no-static-element-interactions -->
	<div on:click|stopPropagation>
        <div on:click={() => dialog.close()} autofocus id="Xited"><Xit></Xit></div>
		<slot name="header" />
		<slot />
        <p></p>
		<!-- svelte-ignore a11y-autofocus -->
	</div>
</dialog>

<style>
	dialog {
		max-width: 32em;
		border-radius: 0.2em;
		border: none;
		padding: 3%;
        background-color: #161616;
        color: #FFFFFF;
	}
	dialog::backdrop {
		background: rgba(0, 0, 0, 1);
	}
	dialog > div {
		padding: 1em;
	}
	dialog[open] {
		animation: zoom 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
	}
	@keyframes zoom {
		from {
			transform: scale(0.95);
		}
		to {
			transform: scale(1);
		}
	}
	dialog[open]::backdrop {
		animation: fade 0.2s ease-out;
	}
	@keyframes fade {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
	}
	button {
		display: block;
	}
    #Xited {
        position: absolute;
        top: 10%;
        right: 7%;
    }
</style>
