abstract sig Rola {}
one sig Ofiara, Morderca, Świadek, Policjant, Sędzia, Kat  extends Rola {}

abstract sig Osoba {
	rola: Rola
}
one sig Clayton, Forbes, Graham, Holgate, McFee, Warren extends Osoba {}

fact {
	Osoba.rola = Rola	

	// Pan McFee znał zarówno ofiarę, jak i mordercę.
	McFee.rola not in Ofiara + Morderca

	// W sądzie, sędzia zapytał pana Claytona o jego relację z przebiegu zdarzenia.
	Clayton.rola not in Sędzia + Ofiara + Kat

	// Pan Warren był ostatnią osobą, która widziała pana Forbesa żywego.
	Warren.rola in Kat + Morderca
	Forbes.rola in Ofiara + Morderca

	// Policjant zeznał, że spotkał pana Grahama w pobliżu miejsca znalezienia ciała.
	Graham.rola not in Policjant + Ofiara + Kat + Sędzia

	// Panowie Holgate i Warren nigdy się nie spotkali.
	Holgate.rola + Warren.rola = Ofiara + Kat
}

run {}
