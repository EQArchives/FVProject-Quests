my @Data = ("lavastorm", 27, 527, 935, 55, 106);

sub EVENT_SPAWN {
	#:: Create a proximity 400 units across, without proximity say
	quest::set_proximity($x - 200, $x + 200, $y - 200, $y + 200, $z - 200, $z + 200, 0);
	#:: Create a HP event at 96 percent health
	quest::setnexthpevent(96);

	#:: Disable Pre-Revamp spawn point for Zordak Ragefire in Nagafen's Lair
	quest::disable_spawn2(369867);
	#:: Send a signal '1' (depop) to Nagafen's Lair >> Zordak_Ragefire (32038) with no delay
	quest::signalwith(32038, 1, 0);
}

sub EVENT_DEATH {
	#:: Enable Pre-Revamp spawn point for Zordak Ragefire in Nagafen's Lair
	quest::enable_spawn2(369867);
}

sub EVENT_AGGRO {
	#:: Create a timer 'leash' that triggers every second
	quest::settimer("leash", 1);
	
	#:: Trigger EVENT_ENTER subroutine to makue sure we banish out of level clients
	EVENT_ENTER();
}

sub EVENT_HP {
	#:: Stop the timer 'leash' from triggering
	quest::stoptimer("leash");
	#:: Trigger EVENT_AGGRO subroutine to makue sure the timer is running
	EVENT_AGGRO();
	#:: Set another HP event to catch any HP loss
	quest::setnexthpevent(int($npc->GetHPRatio())-9);
}

sub EVENT_ENTER {
	if (($ulevel >= 53) && ($status < 80)) {
		quest::echo(0, "I will not fight you, but I will banish you!");
		#:: Move player to Lavastorm (27) at the specified coordinates
		$client->MovePC($Data[1], $Data[2], $Data[3], $Data[4], $Data[5]);
	}
}

sub EVENT_TIMER {
	#:: Match timer 'leash'
	if ($timer eq "leash") {
		if ($x < -1000 || $x > -650 || $y < -1500 || $y > -1290) {
			#:: Trigger WIPE_AGGRO subroutine
			WIPE_AGGRO();
		}
		my @hate_list = $npc->GetHateList();
		my $hate_count = @hate_list;
		if ($hate_count > 0) {
			foreach $ent (@hate_list) {
				my $h_ent = $ent->GetEnt();
				if ($h_ent->IsClient()) {
					if ($h_ent->GetLevel() > 52) {
						quest::ze(0, "I will not fight you, but I will banish you!");
						#:: Move player to Lavastorm (27) at the specified coordinates
						$h_ent->CastToClient()->MovePC($Data[1], $Data[2], $Data[3], $Data[4], $Data[5]);
					}
				}
			}
		} 
		else {
			#:: Trigger WIPE_AGGRO subroutine
			WIPE_AGGRO();
		}
	}
}

sub WIPE_AGGRO {
	$npc->BuffFadeAll();
	$npc->WipeHateList();
	$npc->SetHP($npc->GetMaxHP());
	$npc->GMMove($npc->GetSpawnPointX(), $npc->GetSpawnPointY(), $npc->GetSpawnPointZ(), $npc->GetSpawnPointH());
	#:: Stop the timer 'leash' from triggering
	quest::stoptimer("leash");
	#:: Create a HP event at 96 percent health
	quest::setnexthpevent(96);
}

sub EVENT_SIGNAL {
	#:: Match a signal '2' from Nagafen's Lair >> Zordak_Ragefire (32038)
	if ($signal == 2) {
		#:: Send 
		quest::signalwith(32038, 1, 0);
	}
}

