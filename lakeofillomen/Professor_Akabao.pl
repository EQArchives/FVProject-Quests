#:: VP Key

sub EVENT_SAY {
	if ($text=~/hail/i) {
		if ( quest::is_content_flag_enabled("Kunark_HoleEra")) {
			quest::say("Salutations, traveler! I dont get many visitors in these isolated regions. Have you come to learn of the ancient tribes of the Iksar?");
		}
	}
	elsif ($text=~/tribes/i) {
		if ( quest::is_content_flag_enabled("Kunark_HoleEra")) {
			quest::say("There were five tribes of Iksars that rose from the ashes of the Shissar Empire and founded their kingdoms on the continent of Kunark. Three of the tribes were extinguished many years later by the Kunzar tribe which is the tribe that the current Iksar are descendant from. I focus my studies on learning of the extinct tribe of Kylong.");
		}
	}
	elsif ($text=~/kylong/i) {
		if ( quest::is_content_flag_enabled("Kunark_HoleEra")) {
			quest::say("The Kylong were a mountain dwelling tribe of Iksar that strove for esoteric knowledge. They had vast libraries of ancient magical tomes that had been acquired from the Shissar sorcerers, and strove to understand and put the rituals documented in the tomes to practical use. When the Kunzar armies marched upon the Kylong, the three greatest Kylong mystics shattered the Medallion of Kylong, a holy relic of their tribe, and fled their mountain homes in order to prevent the Kunzar from reassembling the Medallion of Kylong.");
		}
	}
	elsif ($text=~/medallion/i) {
		if ( quest::is_content_flag_enabled("Kunark_HoleEra")) {
			quest::say("I have been attempting to learn of the destinations of the three Kylong leaders that held the fragments of the medallion. I know only that they sought shelters to hide and continue the practice of their mystical arts In order to one day return their tribe to it's former glory. Their remains may exist beneath some of the fortresses that are centers of Iksar and Sarnak necromancy. I have seen indications that some of the tomes within those fortresses are in fact the very tomes once cherished by the Kylong. Should you manage to recover the broken pieces of the Medallion of Kylong bring them to me so that I may restore the ancient artifact.");
		}
	}
}

sub EVENT_ITEM {
	if ( quest::is_content_flag_enabled("Kunark_HoleEra")) {	
		#:: Match a 19962 - Piece of a medallion, a 19963 - Piece of a medallion, and a 19964 - Piece of a medallion
		if (plugin::takeItems(19962 => 1, 19963 => 1, 19964 => 1)) {
			quest::say("For ages this medallion has been scattered across these inhospitable lands, I had just about given up hope of locating the pieces and rebuilding this piece of Iksar history. You may keep it. It is enough to know that I have done my part to restore such an artifact to the people of Norrath.");
			#:: Give a 19955 - Medallion of the Kylong
			quest::summonitem(19955);
			#:: Ding!
			quest::ding();
			#:: Grant a moderate amount of experience
			quest::exp(1000);
		}
		#:: Match a 19962 - Piece of a medallion
		elsif (plugin::takeItems(19962 => 1)) {
			quest::say("Are you daft? How can I reconstruct the medallion of the Kylong without all three pieces?!");
			quest::summonitem(19962);
		}
		#:: Match a 19963 - Piece of a medallion
		elsif (plugin::takeItems(19963 => 1)) {
			quest::say("Are you daft? How can I reconstruct the medallion of the Kylong without all three pieces?!");
			quest::summonitem(19963);
		}
		#:: Match a 19964 - Piece of a medallion
		elsif (plugin::takeItems(19964 => 1)) {
			quest::say("Are you daft? How can I reconstruct the medallion of the Kylong without all three pieces?!");
			quest::summonitem(19964);
		}
	}
	
	#:: Return unused items
	plugin::returnUnusedItems();
}
