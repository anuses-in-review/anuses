<script lang="ts">
    import {base} from "$app/paths";
    import Modal from "$lib/modal.svelte";
    let showInstructions: boolean = false;
</script>

<body class="slay">
	<table align="center" width="900px" cellpadding="60px">
		<tr>
			<td class="yuh">
				<p><span style="font-size: 24px"><b>Guess Who</b></span></p>
				<p>
					<span style="font-size: 18px"><b>First time playing?</b></span><br />
					Click <a on:click={() => (showInstructions = true)}>here</a> to read how the game is played
					and what files you need to download prior to play.
				</p>
				<p>
					<span style="font-size: 18px"><b>Already know how to play?</b></span><br />
					Use the links below to navigate to the files required to play:
				</p>
				<p>
					<a href="{base}/guess-who-board-list"
						><button class="button button1"><b>Boards</b></button></a
					>
					<a href="{base}/guess-who-selector-list"
						><button class="button button1"><b>Cards</b></button></a
					>
				</p>
			</td>
		</tr>
	</table>

	<!-- Modals -->

	<Modal bind:showModal={showInstructions}>
		<p><center><b><span style="font-size: 24px">Guess Who Instructions</span></b></center></p>
		<p>
			<b><span style="font-size: 18px"></span>How do I play?</b><br />
			The rules and gameplay are the same as the classic Guess Who game, with a slight adjustment for
			the digital nature of the boards and cards:<br />
		</p>
		<ol type="1">
			<li>
				Each player downloads a board and opens it in the PDF editing software of their choice.
				There are multiple boards available, so make sure you and the other player(s) have selected
				the same board(s).
			</li>
			<li>
				Each player then navigates to the card selector associated with the selected board(s). Each
				selector can be found on
				<a href="{base}/guess-who-selector-list">this list</a>. Like in classic Guess Who, each
				player must "pick" a card as their face card. To do so, click the "Select Your Card" button.
				Your face card will be displayed below the button. The other player(s) will do the same.
				<b><span style="color: #FF628B">Players may have the same card!</span></b>
			</li>
			<li>
				Decide which player goes first. This play asks a Yes/No question (e.g., "Was this person in
				Theater?"). The other player answers the question and the asking player eliminates suspects
				from their board based on the answer. Players continue to take turns asking questions.
			</li>
			<li>
				Once you would like to guess another player's face card, you can ask, "Is your person
				[Name]" instead of your Yes/No question. If you are correct, you win against that player. If
				you are incorrect, you lose. A guess counts as your turn and cannot be asked immediately
				after a Yes/No question.
			</li>
		</ol>
		<p>
			<b><span style="font-size: 18px"></span>What files do I need?</b><br />
			As mentioned above, you need to download the board decided on by you and the other player(s). A
			list of which can be found <a href="{base}/guess-who-board-list">here</a>. Once you have
			downloaded the file, open it in the PDF editor of your choice. You do not need to download any
			files for the face cards. To select your card, you can navigate to the appropriate selector
			from <a href="{base}/guess-who-selector-list">this list</a>.
		</p>
	</Modal>
</body>
