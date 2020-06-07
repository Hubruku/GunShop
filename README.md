# GunShop

## HappyGun
HappyGun je název pro menší obchod se zbraněmi, zabývající se prodejem munice a zbraní. Obchod prodává pouze základní zbraně bez dalšího vybavení na zbraň ( barrely, dust covery, gripy, foregripy atp. ). Mezi vybavení považujeme i kolimátory, optiky a taktické zařízení ( svítilny, lasery ).

Obchod si eviduje v databázi různé entity.

## Zbraň
U zbraně je vždy unikátní umělý primární klíč. Jako kandidátní klíč pro tuto entitu lze navrhnout výrobní číslo zbraně, což je unikátní kód, velice podobný rodnému číslu. Zbraň má dále model ( např. MPX, FAL, ... ), cenu za jednotku a rok návrhu. Zbraň má taktéž následující atributy, které jsou realizovány jako cizí klíč: výrobce, typ a munice. Zbraň je vyrobena vždy právě jedním výrobcem, ale výrobce může vyrobit víc zbraní ( nemusí vyrobit žádnou, hodí se například v případě, že výrobce je nový na trhu a obchod zatím nezavedl žádné zbraně od tohoto výrobce do prodeje ). Zbraň je právě jednoho typu, a typ může mít víc zbraní ( nemusí mít žádnou, například zbraně nepovolené pro prodej, které se ale hodí evidovat kvůli různým jiným účelům ). Zbraň má právě jednu kompabilitní munici, ale munice může být kompabilitní s více zbraněmi ( nemusí být kompabilitní s žádnou zbraní, třeba se jedná o nový typ munice a zbraň pro tuto munici není v prodeji ). Tato vazba je zjednodušená, protože reálně existuje několik druhů munice od dané ráže, které se liší v různých parametrech ( průbojnost, jádro střely, množství střelného prachu atp. ).

## Munice
U munice evidujeme název. Dále evidujeme cenu za jednotku, hmotnost projektilu ( jednotka GRAIN ), úsťovou rychlost ( jednotka metry za sekundu ) a energii ( jednotka JOULE )- tyto atributy obsahují PRŮMĚRNÉ údaje o dané munici. Úsťová rychlost se odvíjí u každé munice podle délky "barrelu".

## Výrobce
U výrobce evidujeme název, rok založení a dále adresu, která je realizována jako cizí klíč.

## Adresa
V adrese pak evidujeme ulici, popisné číslo, město, PSČ a zemi, která je realizována jako cizí klíč. Ulice a číslo popisné jsou nepovinné, protože výrobce zbraní často neuvádí přímo ulici a popisné číslo. V databázové aplikaci by ale mělo být pro zákazníka povinností vložit i ulici a číslo popisné. Tato entita způsobuje to, že databáze je ve druhé normální formě. Každý atribut je totiž závislý na nějakém jiném, což zásadně porušuje pravidla 3. NF. Do třetí bychom ji převedli pouze, kdybychom pro každý daný atribut udělali entitu zvlášť. Kvůli zjednodušení ponechám entitu v tomto stavu, a tudíž databáze bude ve 2. NF.

## Země
Intuitivně bude země obsahovat pouze název dané země a její zkratku. Entita taktéž porušuje pravidla 3. NF. Konkrétně název zkratky je závislý na názvu země. Jelikož už ale 3. NF. porušuje adresa, rozhodl jsem se entitu ponechat takto.

## Typ
U typu nám postačí evidovat jeho název.

## Prodej
Prodej je realizován pomocí samostatné entity. V té se eviduje zákazník, který zboží kupuje, zaměstnanec ( pověřená osoba ), datum provedení prodeje a volitelnou poznámku. Datum a čas provedení prodeje se automaticky nastaví na aktuální datum a čas, pomocí triggeru. Jelikož ale bude skript znovu spuštěn, rozhodl jsem se v triggeru udělat podmínku. Pokud nevložíme vlastní datum při vkládání do insertu, trigger to automaticky nastaví na aktuální datum a čas. Jinak tam zůstane naše datum. Rozhodl jsem se tak, abych nad tím mohl efektivně dělat dotazy.

## Zákazník
U zákazníka evidujeme adresu jako cizí klíč. Dále evidujeme klasické atributy - jméno, příjmení, telefon a email.

## Zaměstnanec
U zaměstnance postačí evidovat jméno, příjmení a taktéž osobní číslo ( kandidátní klíč ).

## Položka
Položka je tabulka, která je supertypem ISA hierarchie. Jejími podtypy je zbraň a munice. Obě tyto tabulky jsou identifikačně závislé na Položce. Položka obsahuje 2 atributy : id_polozky a cenu za jednotku ( v Kč ).

## Prodej_položky
Prodej položky je realizován jako slabá entita. Jedná se o vazební tabulku mezi entitou "Prodej" a entitou "Položka". Entita obsahuje 2 cizí klíče, jejichž kombinace tvoří primární klíč. Dále entitu množství. Pokud bychom chtěli koupit 2 stejné zbraně, stačí pozměnit údaj o množství, stejně jako kdybychom chtěli koupit víc munice, stačí pozměnit údaj o množství.

## Deklarativní integrita dat
### Doménová integrita ( přes check constraint )
Doménovou integritu ( resp. ochranu vstupů ) řeším pomocí checků v DDL příkazech pro vytvoření některých tabulek. Zvolil jsem pouze nejpodstatnější ošetření.

### Zbraň
Rok návrhu zbraně je větší než 1800 | Název modelu zbraně je delší než 1 znak

### Výrobce
Rok založení výrobce je větší než 1800 | Název výrobce je delší než 3 znaky

### Prodej položky
Množství kupovaných kusů je maximálně 1 000 ( určeno hlavně pro munici, neočekává se koupě tolika zbraní )

### Adresa
PSČ je maximálně 10 znaků ( Wikipedie ) | Název města je delší než 2 znaky

### Položka
Cena je nenulová a kladná

### Munice
Název munice je delší než 1 znak

Doménová integrita je pouze na ukázku, je lepší si doménovou integritu zajistit v samotné databázové aplikaci, kde se dají chyby lépe ošetřit.
Referenční integrita ( on delete )
Referenční integritu ( ochranu cizích klíčů na straně N při smazání údaje na straně 1 ) řeším u všech entit s vazbou 1:N v databázi.

## Výrobce-zbraň
V případě, kdy by byl smazán nějaký výrobce, se všechny zbraně od daného smazaného výrobce taky smažou. V mnoha případech může tato referenční integrita pomoci ( nepohodnutí se s výrobcem, zákaz prodeje od toho výrobce atp. ). Nicméně se doporučuje, aby právo na smazání záznamů neměl obyčejný zaměstnanec. ON DELETE CASCADE

U ostatních entit mi nepřišlo vhodné jakoukoliv referenční integritu používat. Dalo by se říct, že je to zde taktéž pouze na ukázku.
Entitní integrita ( univerzálnost )
Entitní integrita je ve všech tabulkách zajištena existencí umělého primární klíče, na kterém je použita sekvence a trigger ( auto_increment ). Pouze entity Zbraň a Munice neobsahují vlastní primární klíče, protože jsou identifikačně závislé na svém nadtypu Položka. Jedná se o ISA hierarchii. Nicméně jsou tabulky taktéž univerzální.

## Procedurální integrita dat
Trigger hlídající rok založení u výrobce
Trigger before insert / update. Pokud je nějaký vkládaný rok z budoucnosti, automaticky ho nastaví na aktuální rok a vypíše do konzole.

Trigger hlídající rok návrhu u zbraně
Trigger before insert / update. Pokud je nějaký vkládaný rok z budoucnosti, automaticky ho nastaví na aktuální rok a vypíše do konzole.

Trigger hlídající datum provedení prodeje
Trigger before insert. Pokaždé před insertem ( pokud v insertu datum není explicitně dáno ) nastaví hodnotu new.datProd na aktuální čas. Update neřeším, protože by přepisoval i už zadané obchody. Doporučuji ale dát práva na update na této tabulce adminovi, nikoliv ostatním uživatelům databáze.

Trigger nastavující název podtypu do atributu polozka_TYPE v supertypu ( ISA hierarchie )
Jelikož ne všechny data do insert scriptu můžu generovat, rozhodl jsem se udělat si trigger, který mi sám nastaví do "discrimination value" v super typu typ podle ceny. Respektive zadám položku za 200 Kč, tak vím, že to nebude zbraň, ale munice. Tudíž mi stačí zadat cenu. ID se pomocí triggeru a sequence samo zvýší o 1 a polozka_TYPE se mi nastaví na 'munice'. Trigger vygenerovaný pro hlídání ISA hierarchie pak vezme obsah atributu polozka_TYPE, na něj zavolá atribut id_polozky a porovná to s přidávaným. Takhle si oracle hlídá univerzálnost každého záznamu u ISA hierarchie.


