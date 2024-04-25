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
		
		<h1><center>Juegos de Chisme</center></h1>
		
		<!-- Navigation -->
		
		<p><center>
			<a href="{base}/"><button class = "button button1"><b>Home</b></button></a>
			<a href="{base}/guess-who"><button class="button button1"><b>Guess Who</b></button></a>
			<a href="{base}/loteria"><button class="button button1"><b>Lotería</b></button></a>
		</center></p>
		
		</td>
		</tr>
		</table>
	</body>
	
	<p></p>
	
	<slot/>
</main>