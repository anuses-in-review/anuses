<script lang="ts">
    import {base} from "$app/paths";
    import Modal from "$lib/modal.svelte";
    let showInstructions: boolean = false;
    
    // Fetching from R
    let txtContent = "";
    fetch('code.txt')
        .then(response => response.text())
        .then(data => {
            txtContent = data;
        })
    .catch(error => {
        console.error('Error fetching txt file:', error);
    });

</script>

<body class="slay">
	<table align="center" width="900px" cellpadding="60px">
		<tr>
			<td class="yuh">
				<p><span style="font-size: 24px"><b>Most Recent Data</b></span></p>
				<p>
					<span style="font-size: 18px"><b>Last Month at a Glance</b></span><br />
					{@html AtAGlance}
				</p>
			</td>
		</tr>
	</table>

	<!-- Modals -->

	<Modal bind:showModal={showInstructions}>
		<p><center><b><span style="font-size: 24px">Example title</span></b></center></p>
		<p>Example text</p>
	</Modal>
</body>

<style>
    .slay {
        background-color: #000000;
    }
    .yuh {
        background-color: #161616;
    }
    /* hr {
        width: 45px;
    } */
    a:link {
        color: #F4BC53;
        background-color: transparent;
        text-decoration: none;
    }
    a:visited {
        color: #F4BC53;
        background-color: transparent;
        text-decoration: none;
    }
    a:hover {
        color: #33A7BA;
        background-color: transparent;
        text-decoration: bold;
    }
    a:active {
        color: #F4BC53;
        background-color: transparent;
        text-decoration: bold;
    }
    b {
        font-family: Avenir Next;
    }
    /* .button {
        border: none;
        color: #FFFFFF;
        padding: 12px 28px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-family: Avenir Next;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
    } */
    /* .button1 {
        background-color: #F4BC53;
    } */
    /* .button1:hover {
        background-color: #33A7BA;
    } */
    /* .button2 {
        background-color: #FF628B;
    } */
</style>
