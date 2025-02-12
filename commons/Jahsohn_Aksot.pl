sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.");
	}
	if ($text=~/rykas gave it to me/i) {
		quest::say("I have not heard of anyone speaking that name out loud in years. Rykas once shared a tale with me, though I have lived with fear in my mind ever since. He told me afterwards that I did not have the balance I thought I had. Have you come for the Words of Magi'kot?"); 
	}
	if ($text=~/words/i) {
		quest::say("The Words of Magi'kot can only be shared with those elementalists whose minds are of balance. The Words were separated into three pieces by a high council of Magi who feared that the story would bring an end to elementalists throughout Norrath. If you feel you wish to read from the sacred Power of the Orb then an elementalist of such power should easily accomplish this task.");
	}
	if ($text=~/what task/i) {
		quest::say("Bring me the torn pages of Magi'kot. The first section can be found in the depths of a tainted forest, warded by an angry lupine. It is also rumored that one section is found in the haunted estate of a murderer, on a many armed creature. The last may be found in the belly of an amphibian who thirsts for blood.");
	}
	#:: Mage Epic 1.5 Quest dialogue from the Omens of War expansion
	if (quest::is_omens_of_war_enabled()) {
		if ($text=~/bantil sent me/i) {
			quest::say("You are working with Bantil? I hope you had some luck finding the books. Let me know if there is anything I can do to help you. Bantil is a friend, despite his gnomish heritage.");

			$mage_epic_jah = $name . "-mage_epic_jah";
			quest::set_data($mage_epic_jah, 1);

			$mage_epic_wal = $name . "-mage_epic_wal";
			if(defined quest::get_data($mage_epic_wal)) {
				quest::say("Oh, you may want to speak to Akksstaff again, he and Bantil never quite saw eye to eye, you may want to ask him about Bantil again.");
			}
		}   
	}
}

sub EVENT_ITEM {
	#:: Match a 28035 - Token of Mastery
	if (plugin::takeItems(28035 => 1)) {
		quest::say("What is this? I cannot believe you found it! Where did you get this?");
		#:: Give 50 experience
		quest::exp(50);
	}
	
	#:: Match a 28000 - Torn Page of Magi`kot pg. 1, 28001 - Torn Page of Magi`kot pg. 2, 28002 - Torn Page of Magi`kot pg. 3
	if (plugin::takeItems(28000 => 1, 28001 => 1, 28002 => 1)) {
		quest::say("Rykas may have been right about you, $name. Now, go find Walnan. Walnan was apprenticed to a very powerful Mage. After her apprenticeship was complete, she wished to begin teaching other beings of Norrath. Even those who knew nothing of the art! I do not believe she was successful, though. Seek her out to further your tale. Good luck in your journeys, $name!");
		#:: Give a 28003 - Words of Magi`kot
		quest::summonitem(28003);
	}

	#:: Return unused items
	plugin::returnUnusedItems();
}
