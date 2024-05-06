<script lang = 'ts'>
	import "$lib/styles.css"
	import { base } from "$app/paths";
</script>

<!-- Main body -->

<main>
	<body class = "slay">
		<table align="center" width="900px" cellpadding="60px">
		<tr>
		<td class = "yuh">
		
		<h1><center>Anuses in Review</center></h1>
		
		<!-- Navigation -->
		
		<p><center>
			<a href="{base}/"><button class = "button button1"><b>Home</b></button></a>
			<a href="{base}/most-recent"><button class="button button1"><b>Most Recent</b></button></a>
			<a href="{base}/all-data"><button class="button button1"><b>All Data</b></button></a>
			<a href="{base}/plots"><button class="button button1"><b>Peelots</b></button></a>
		</center></p>
		
		</td>
		</tr>
		</table>
	</body>
	
	<p></p>
	
	<slot/>
</main>