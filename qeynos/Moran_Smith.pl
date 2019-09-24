sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings!!  Moran here.  I just love this city.  I traveled from Freeport to Qeynos to stay far from the [" . quest::saylink("Freeport Militia") . "].");
	}
	elsif ($text=~/freeport militia/i) {
		quest::say("The Freeport Militia are nothing more than thugs.  I have seen them lay waste to more than a dozen adventurers at once.  For no reason other than to flex their muscles!");
	}
}

sub EVENT_SIGNAL {
	#:: Match signal "1" from qeynos/campnight.pl
	if ($signal == 1) {
		#:: Stop pathing grid 60
		quest::stop();
		#:: Missing equivalent perl function for lua e.self:MerchantCloseShop();
	}
	#:: Match signal "2" from qeynos/campday.pl
	elsif ($signal == 2) {
		#:: Start pathing on grid 60
		quest::start(60);
		#:: Missing equivalent perl function for lua e.self:MerchantOpenShop();
	}
	#:: Match signal "3" from qeynos/Kazlo_Naedra.pl
	elsif ($signal == 3) {
		quest::say("Heh.. Why don't you try Freeport.. or Erudin.. ANYwhere but here!");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
