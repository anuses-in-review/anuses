<script lang="ts">
    import {base} from "$app/paths";
    import Modal from "$lib/modal.svelte";
    let showInstructions: boolean = false;
</script>

<body class="slay">
	<table align="center" width="900px" cellpadding="60px">
		<tr>
			<td class="yuh">
				<p><span style="font-size: 24px"><b>Plots, baby!!!</b></span></p>
				<img src="{base}/exports-from-r/plot_gend_perc_year.png" alt="Flowers in Chania">
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

