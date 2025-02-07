sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Yes, young one?");
	}
	if ($text=~/i am ready for the test of the phantasm/i) {
		quest::say("It will be simple, go collect these items and return them to me. Head of a serpent, essence of a ghost, essence of a vampire, and sands of the mystics. Do so and you will receive the last of the pieces. Be sure to combine them in a sack first. Just ask and I will provide you with one.");
	}
	if ($text=~/head of a serpent/i) {
		quest::say("Serpent is probably not an accurate term for what you must return to me. It is actaully the reminants of a spirit. The spirit is one which was erradicated long long ago by the Iksar. I believe they were called the Shissar. You may need to travel to the Iksar city to learn more about these creatures.");
	}
	if ($text=~/essence of a ghost/i) {
		quest::say("You don't have to look far to find roaming spirits. One in particular though has more meaning then the other sorry souls trapped here. You see, Kindle was a dear friend of mine. I came in search of him when he stopped writing. Well...look at me now. I fear that I have succumbed to the same fate as poor Kindle.");
	}
	if ($text=~/essence of a vampire/i) {
		quest::say("The essence of a vampire is just that. Only the most powerful of these creatures will possess what you need.");
	}
	if ($text=~/sands of the mystic/i) {
		quest::say("They are sands that were imbued with the magical might of the mystics. Mystics use a ritual involving their own blood to create a powerful bond with the sand. One will need to search the shores.");
	}
}

sub EVENT_ITEM {
	#:: Match a 10604 - Jeb's Seal
	if (plugin::takeItems(10604 => 1)) {
		quest::say("Jeb has spoken with you already, excellent. Tell me are you ready for the test of the phantasm?");
		#:: Give a 10604 - Jeb's Seal
		quest::summonitem(10604);
		#:: Give a 17861 - Enchanters Sack
		quest::summonitem(17861);
	}
	#:: Match a 10638 - Sack For Polzin
	elsif (plugin::takeItems(10638 => 1)) {
		quest::say("You have done well, take this last piece and return them to Jeb. He will be able to complete the final crafting.");
		quest::faction(404, 30); # Faction: +30 Truespirit
		#:: Give 100,000 experience
		quest::exp(100000);
		#:: Give a 10613 - 4th Piece of Staff
		quest::summonitem(10613);
	}

	#:: Return unused items
	plugin::returnUnusedItems();
}
