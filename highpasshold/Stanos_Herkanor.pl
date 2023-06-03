sub EVENT_SAY {
	#:: Fatestealer is the Rogue Epic 1.5 from the Omens of War expansion
	$key_Fatestealer = $name . "-rogue_epic-Fatestealer";
	my $rogue_epic = quest::get_data($key_Fatestealer);

	if ($text=~/hail/i) {
		#:: Rogue Epic 1.5: If player has a 11057 - Ragebringer (thus completed Rogue Epic 1.0) and has not started Rogue Epic 1.5: Fatestealer
		if (quest::is_omens_of_war_enabled() && ($inventory->HasItem(11057) eq 1) && (!defined $rogue_epic)) {
			quest::say("Ha, the prodigy returns. So good to see you, $name. I always consider it an honor to have your company, and we have much to talk about!");
			quest::set_data($key_Fatestealer, "1", "F");
			#:: Stanos should be saying the next line in Thieves Cant
			quest::say("But not here and not now. We are in grave danger, you and I, and should not be seen speaking to one another. Seek out my associates. They will apprise you of what needs to be done. When you have found them... Tell them that the sun is setting on the horizon.' He clasps your palm and gives you a strange handshake, 'Before you go, know that you have proved yourself as one of us, $name. You are a member of this circle and nothing will ever break that.");	
		#:: Rogue Epic 1.5 - Player did not previously complete Rogue Epic 1.0
		} elsif (quest::is_omens_of_war_enabled() && !defined $rogue_epic) {
			quest::say("We are in grave danger, you and I, and should not be seen speaking to one another. Seek out my associates. They will apprise you of what needs to be done. When you have found them... Tell them that the sun is setting on the horizon.' He clasps your palm and gives you a strange handshake, 'Before you go, know that you have proved yourself as one of us, $name. You are a member of this circle and nothing will ever break that.");
		} else {
			#:: Rogue Epic 1.0: Stanos was likely triggered to spawn because you gave a Stanos' Pouch to Anson_McBale
			quest::say("Ah, the pouch. This is the first step, Anson. The Circle has to be upset having this taken right out from under them. That speaks well of the person who did the taking. Hanns must be even more furious now. I think I might be able to trust you. We could make a deal. I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you. Of course, you would have to do something for me first. Let me tell you my story, then you decide.");
			#:: Send signal '2' to Anson_McBale (5037 highpass, 407060 highpasshold) with a 0ms wait
			quest::signalwith(5037, 2, 0);
		}
	} elsif ($text=~/who are you/i) {
		quest::say("(chuckle) You are young, aren't you? I ran [" . quest::saylink("the Circle") . "] out of Qeynos for well over 30 years, and did a right fine job of it. It's a long story, and isn't over yet. I have much to answer for.");	
	} elsif ($text=~/the circle/i) {
		quest::say("The Circle of Unseen Hands, you oaf! The largest collection of thieves, murderers, con artists, and rogues in the world. No finer men can be found anywhere.");
	} elsif ($text=~/deal/i) {
		quest::say("Aye, $name we could make a deal. I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you. Of course, you would have to do something for me first. Let me tell you my [" . quest::saylink("story") . "], then you decide");			
	} elsif ($text=~/story/i) {
		quest::say("Johann Krieghor was the leader of the Circle and I was his second-in-command. He made a dark bargain with a Teir'Dal [" . quest::saylink("General") . "]. The Circle was to assassinate [" . quest::saylink("Joren") . "], the high elf ambassador to Qeynos. Had the plot worked, it would have weakened the alliance between high elves and humans, and possibly caused a war between the two powers. In either case, the Teir'Dal would have profited greatly by this event, and all others would have suffered. I could not stand by and let this happen, but Johann would not be deterred, for the Teir'Dal had promised him much. I had no choice but to kill Johann and the Teir'Dal agent. I made it look like they offed each other, and then I hid the [" . quest::saylink("tools") . "].");
	} elsif ($text=~/joren/i) {
		quest::say("Joren was the boon companion to the King of Felwithe, a mighty paladin of great reknown, much loved by all the high elves. To slay him, certain. . .items. . .were crafted to make the job possible. With the death of the Teir'dal agent, and my theft of the [" . quest::saylink("tools") . "], the General was forced to abandon the plot.");
	} elsif ($text=~/general/i) {
		quest::say("The General? I know not his true name, only that he is ranked high among the dark elves. He kept his identity secret, and it was only upon the death of his agent that I even learned the smallest amount about him, that of his Generalship. Knowing who he is would aid me greatly.");
	} elsif ($text=~/hanns/i) {
		quest::say("Hanns Krieghor was a talented young man, in many ways much more of a man than his father. After the death of [Johann], I raised Hanns as my own son, and grew to love him as such. A few years back, to take revenge upon me for his [" . quest::saylink("father's murder") . "] Hanns seized control of the Circle. At the same time, he sent four of his best killers to finish me. The killers failed, I still live. Hanns still leads the Circle in Qeynos, and still seeks [" . quest::saylink("your head", 0, "my head") . "]");	
	} elsif ($text=~/father's murder/i) {	
		quest::say("Well, it's no great secret now that I was responsible for the death of Johann Krieghor, Hanns Krieghor's father. Johann used to lead the Circle. Hanns was but a pup when his father died at my hand, and became as a son to me. Hanns did not discover that I was the one who killed his father until many years later. For that, he wants [" . quest::saylink("your head", 0, "my head") . "].");		
	} elsif ($text=~/your head/i) {
		quest::say("Aye, $name, Hanns has wanted me dead for years. He's tried many times, though not personally. He's smart, that one, for not facing me, but foolish for wasting so many good men for naught.");				
	} elsif ($text=~/tools/i) {
		quest::say("To allow the assassin to slay a prince, and fight his way back out, a fell blade was crafted. It was small enough to conceal under a garment and yet large enough to strike a mortal blow through armor. Aided by vile Teir'Dal enchantments, it is much more fearsome than it appears. I would gladly rid myself of it, but I fear I can not until I [" . quest::say_link("clear your name", 0, "clear my name") . "] with Hanns.");
	} elsif ($text=~/clear your name/i) {
		quest::say("I need proof that what I say about Johann is truth, so that Hanns may forgive me. YOU can gather that proof for me. First, travel to Kaladim and Neriak, and there, upon the persons of the rogue guildmasters, you should find that which I seek, two parts of a document I recovered from the dead agent. I entrusted one to Founy, but that trust is gone, and Founy would betray me to Hanns were I to attempt to reclaim it. Tani N'mar has the other, which he should not possess, and keeps it only to spite me, not knowing its real importance. Steal them both, and bring them back to me. And don't let anyone follow you! If I am not around, tell Anson you want to see me.");
		#:: Stanos points
		quest::doanim(64);
	} elsif ($text=~/I killed Renux/i) {
		quest::say("You killed Renux?  You stupid git of a dog!  Renux was my best work, a killer without peer, without remorse.  All I did to her, I did for a reason, and it made her matchless.  Ravens take your eyes!  All you needed to do was gather evidence.  When Hanns' believed me, Renux would follow.  A hollow victory, it seems.  I suppose you had to do it, but I imagine it cost you in the process.  When this is over, perhaps you and I shall have a reckoning.");
		quest::faction(332, -500, 0); #:: Faction: -500 Highpass Guards
	}
}

sub EVENT_ITEM {

	#:: Match a 28010 - Stained Parchment Top, and a 28011 - Stained Parchment Bottom
	if (plugin::takeItems(28010 => 1, 28011 => 1)) {
		quest::say("Excellent! With this document I can. Damnation! Curse my tired old mind, I forgot that I could not read the document. It is written in some obscure code or language. I can't decipher it, but I know someone who can. Seek out one called Eldreth, an Erudite who used to do work for me. I know not where he may be found these days, only that he will not be found in Erudin, as they want his head for some misdeed in the past. Give him the complete parchment, and tell him I sent you. He owes me.");
		#:: Give a 28012 - Combined Parchment
		quest::summonitem(28012);
		#:: Ding!
		quest::ding();
		quest::faction(332, 5, 0); #:: Faction: +5 Highpass Guards
		quest::faction(329, 10, 0); #:: Faction: +10 Carson McCabe
		quest::faction(331, 5, 0); #:: Faction: +5 Merchants of Highpass
		quest::faction(230, 5, 0); #:: Faction: +5 Corrupt Qeynos Guards
		quest::faction(330, 5, 0); #:: Faction: +5 The Freeport Militia
		#:: Give 500 experience
		quest::exp(500);
		#:: Despawns Stanos without a respawn timer (because he's a triggered spawn)
		quest::depop();
		#:: Match a 28013 - General's Pouch, 7506 - Jagged Diamond Dagger, 7505 - Cazic Quill
	} elsif(plugin::takeItems(28013 => 1, 7506 => 1, 7505 => 1)) {
		quest::say("Very well done. I leave now to confront Hanns with this evidence. Even so, it will not be easy to regain his trust. That is why I need those daggers, in case all else fails. Bristlebane grant me luck - I can no longer live like a hunted dog. In any case, I am grateful for your aid. Take this wretched blade, I can bear it no longer. I must warn you, I feel it carries Innoruuk's curse; all who are near it learn the meaning of hate. Ironic, isn't it? You went to all that work to redeem yourself for a rapier, yet the true reward came when you redeemed another..Good luck, $name, for much as I, you will need it.");
		#:: Give a 11057 - Ragebringer
		quest::summonitem(11057);
		#:: Ding!
		quest::ding();
		quest::faction(332, 5, 0); #:: Faction: +5 Highpass Guards
		quest::faction(329, 10, 0); #:: Faction: +10 Carson McCabe
		quest::faction(331, 5, 0); #:: Faction: +5 Merchants of Highpass
		quest::faction(230, 5, 0); #:: Faction: +5 Corrupt Qeynos Guards
		quest::faction(330, 5, 0); #:: Faction: +5 The Freeport Militia
		#:: Give 10,000 experience
		quest::exp(10000);
		#:: Despawns Stanos without a respawn timer (because he's a triggered spawn)
		quest::depop();
		#:: Match a 18961 - Translated Parchment
	} elsif(plugin::takeItems(18961 => 1)) {
		quest::say("Let me see what you have here. Aha, so that's who.. yes, yes! There is one more thing I need you to do. This document tells me who the originator of the plot really was. His name is General V'ghera, which is interesting, as Anson's men have spotted him in Kithicor recently. He will not be easy to get to, but if you give this box to one of his many aides, the General will HAVE to come to investigate. You see, this box used to contain the tools crafted for the assassination. When he arrives, kill him! I need any documents you find on him - with luck it will be enough evidence to convince Hanns that what I say is true. Bring any documents or dispatch cases you find, along with those blades Vilnius made you work so hard for, and we will make a trade.");
		#:: Give a 28057 - Sealed Box
		quest::summonitem(28057);
		#:: Ding!
		quest::ding();
		quest::faction(332, 5, 0); #:: Faction: +5 Highpass Guards
		quest::faction(329, 10, 0); #:: Faction: +10 Carson McCabe
		quest::faction(331, 5, 0); #:: Faction: +5 Merchants of Highpass
		quest::faction(230, 5, 0); #:: Faction: +5 Corrupt Qeynos Guards
		quest::faction(330, 5, 0); #:: Faction: +5 The Freeport Militia
		#:: Give 500 experience
		quest::exp(500);
		#:: Despawns Stanos without a respawn timer (because he's a triggered spawn)
		quest::depop();
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::say("I tend to agree Anson. We could make a [" . quest::saylink("deal") . "]. I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you. Of course, you would have to do something for me first. Let me tell you my [" . quest::saylink("story") . "], then you decide.");
	}
}

sub EVENT_SPAWN {
	#:: 10 minute timer until depop
	quest::settimer("depop", 10 * 60 * 1000);
}

sub EVENT_TIMER {
	if ( $timer eq "depop" ) {
		quest::depop();
	} elsif ( $timer eq "call_help" ) {
		CallHelp();
	}
}

sub CALL_HELP {
	#:: a_smuggler, a_smuggler (407007) highpasshold version, Cyrla_Shadowstepper, Bryan_McGee, Beef, Kaden_Gron, Breck_Damison, Anson_McBale, Dalishea, Crenn_Salbet
	#:: Mardon_Smith, Dovik_Greenbane, Prak, Bartender, Scar, Wres_Corber
	my @StanosFriends = (5019,5038,5107,5056,5055,5050,5051,5037,5009,5053,5060,5061,5054,5069,5134,5052,407007,407063,407052,407025,407027,407048,407056,407060,407032,407051,407058,407057,407049,407040);
	for (@StanosFriends) {
		quest::signal($_, 1);
	}
}

sub EVENT_COMBAT {
	#:: combat state 0 = False, 1 = True
	if ( $combat_state == 1 ) {
		CallHelp();
		quest::pausetimer("depop");
		quest::settimer("call_help", 330000);
	} else {
		quest::resumetimer("depop");
		quest::stoptimer("call_help");
	}
}