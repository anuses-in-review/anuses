<script lang="ts">
    import {base} from "$app/paths";
    import Modal from "$lib/modal.svelte";
    let showInstructions: boolean = false;
</script>

<body class="slay">
	<table align="center" width="900px" cellpadding="60px">
		<tr>
			<td class="yuh">
				<p><span style="font-size: 24px"><b>Most Recent: April 2024</b></span></p>
				<p>this is where this month's stuff will go
				</p>
			</td>
		</tr>
	</table>

	<!-- Modals -->

	<Modal bind:showModal={showInstructions}>
		<p><center><b><span style="font-size: 24px">Guess Who Instructions</span></b></center></p>
		<p>text</p>
	</Modal>
</body>
