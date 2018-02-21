#:: Quest NPC for Taskmaster Earring - Dwarf Male Quest

sub EVENT_ITEM {
	#:: Turn in for 18905 -  Worn Rune (Csb I.O.U Dwf 1)
	if (plugin::check_handin(\%itemcount, 18905 => 1)) {
		quest::say("'Eh, strapling? Ye got this from me ol' partner? Huh. Aye, I know what it means but ye're not hearin'. Here, take this. It was his but he's not needin' it now.");
		#:: Randomly choose from 5037 - Bronze Two Handed Battle Axe, 5029 - Bronze Bastard Sword, 13313 - Dwarven Axe
		quest::summonitem(quest::ChooseRandom(5037,5029,13313));
		#:: Give a small amount of xp
		quest::exp(30000);
		#:: Ding!
		quest::ding();
	}
	#:: Return Unused Items
	plugin::return_items(\%itemcount);
}
