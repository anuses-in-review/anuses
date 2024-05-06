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
				<p>This should give table_anus_play_XXXX: Rank | Order | Title | Artist | Net Plays</p>
				<p>
					<span style="font-size: 18px"><b>First time playing?</b></span><br />
					Click <a on:click={() => (showInstructions = true)}>here</a> to read how the game is played
					and what files you need to download prior to play.
				</p>
			</td>
		</tr>
	</table>

	<!-- Modals -->

	<Modal bind:showModal={showInstructions}>
		<p><center><b><span style="font-size: 24px">Guess Who Instructions</span></b></center></p>
		<p>(yuh)
		</p>
	</Modal>
</body>

