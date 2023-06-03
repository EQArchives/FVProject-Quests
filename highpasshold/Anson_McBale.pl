sub EVENT_SAY {
	
	#:: Make sure player's faction is indifferent or better to Anson McBale
	if ($faction <= 5) {
		if ($text=~/hail/i) {
			quest::emote("looks at you suspiciously. 'Yeah? Whacha want?'");
		#:: Only level 50 or higher Rogues can see Stanos
		} elsif ($text=~/see stanos/i && $class eq "Rogue" && $ulevel >= 50) {
			quest::say("This better be important.");

			#:: Spawn one and only one Stanos Herkanor without grid or guildwar at the specified location and heading
			quest::unique_spawn(5088, 0, 0, 336, 10, 45, 450);
		}
	} else {
		quest::say("Go away! We don't have time for the likes of you.");
	}
}

sub EVENT_ITEM {

	#:: Match a 28014 - Stanos' Pouch from a level 50 or greater Rogue player
	if ( plugin::takeItems(28014 => 1) && $class eq "Rogue" && $ulevel >= 50) {
		quest::say("Ah, we have been expecting this. Let me get Stanos, he will want to inspect it first, but here are your coins.");
		#:: Ding!
		quest::ding();
		quest::faction(332, 50, 0); #:: Faction: +50 Highpass Guards
		quest::faction(329, 7, 0); #:: Faction: +7 Carson McCabe
		quest::faction(331, 7, 0); #:: Faction: +7 Merchants of Highpass
		quest::faction(230, 2, 0); #:: Faction: +2 Corrupt Qeynos Guards
		quest::faction(330, 2, 0); #:: Faction: +2 The Freeport Militia
		#:: Give 500 experience
		quest::exp(500);

		#:: Yellow text color (15) in client chat window
		quest::message(15, "You receive 35 platinum from Anson McBale.");

		#:: Give player 0 copper, 0 silver, 0 gold, 35 platinum, update_client=true
		$client->AddMoneyToPP(0, 0, 0, 35, 1);

		#:: Spawn one and only one Stanos Herkanor without grid or guildwar at the specified location and heading
		quest::unique_spawn(5088, 0, 0, 336, 10, 45, 450);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_SIGNAL {
	#:: Receive signal '2' from Stanos Herkanor as part of the Rogue Epic 1.0 dialogue
	if ($signal eq 2) {
		quest::say("Vilnius has always had a good eye for talent. I think we can trust this one. But will he trust us? You have to wonder if he even knows who we are...");
		#:: Signals Stanos with signal '1' at a 0ms wait
		quest::signalwith(5088, 1, 0);
	}
}