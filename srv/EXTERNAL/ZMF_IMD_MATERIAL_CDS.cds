/* checksum : 438d3b59ff1704c05db0c7dc44d0ceba */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZMF_IMD_MATERIAL_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'MFG - Material Master Data'
entity ZMF_IMD_MATERIAL_CDS.ZMF_IMD_MATERIAL {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  key matnr : String(40) not null;
  @sap.display.format : 'Date'
  @sap.label : 'Creato il'
  @sap.quickinfo : 'Data creazione'
  ersda : Date;
  @sap.label : 'Ora di creazione'
  created_at_time : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autore'
  @sap.quickinfo : 'Nome del responsabile che ha aggiunto l''oggetto'
  ernam : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Ultima modifica'
  @sap.quickinfo : 'Data dell''ultima modifica'
  laeda : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Autore modifica'
  @sap.quickinfo : 'Nome dell''utente autore della modifica oggetto'
  aenam : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato agg. compl.'
  @sap.quickinfo : 'Stato di aggiornamento del materiale completo'
  vpsta : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato aggiornamento'
  pstat : String(15);
  @sap.label : 'Pred.canc.liv.mand.'
  @sap.quickinfo : 'Predisporre alla canc. mat. a livello di mandante'
  lvorm : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di materiale'
  mtart : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Settore industriale'
  mbrsh : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo merci'
  matkl : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice mat. prec.'
  @sap.quickinfo : 'Codice materiale precedente'
  bismt : String(40);
  @sap.label : 'Unità misura base'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  meins : String(3);
  @sap.label : 'UM ordine d''acquisto'
  @sap.quickinfo : 'UM dell''ordine d''acquisto'
  @sap.semantics : 'unit-of-measure'
  bstme : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Documento'
  @sap.quickinfo : 'Numero documento (senza sistema gestione documenti)'
  zeinr : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di documento'
  @sap.quickinfo : 'Tipo documento (senza sistema gestione documenti)'
  zeiar : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Versione documento'
  @sap.quickinfo : 'Versione del documento (senza sistema gestione documenti)'
  zeivr : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Formato pagina'
  @sap.quickinfo : 'Formato pag. documento (senza sistema gestione documenti)'
  zeifo : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Numero mod. doc.'
  @sap.quickinfo : 'N. modifica del documento (senza sistema gestione documenti)'
  aeszn : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Numero della pagina'
  @sap.quickinfo : 'N. pagina documento (senza sist. gestione documenti)'
  blatt : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'N. di fogli'
  @sap.quickinfo : 'Numero fogli (senza sistema di gestione documenti)'
  blanz : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Avv. prod./controllo'
  @sap.quickinfo : 'Avvert. produz./controllo'
  ferth : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Formato DIN'
  @sap.quickinfo : 'Formato DIN istruzioni di produzione'
  formt : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Grandezza/dimensione'
  groes : String(32);
  @sap.label : 'Mat. base'
  wrkst : String(48);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Definizione standard'
  @sap.quickinfo : 'Definizione standard (es. DIN)'
  normt : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Laboratorio/ufficio'
  @sap.quickinfo : 'Laboratorio / Uff. progettazione'
  labor : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ch. valori acquisto'
  @sap.quickinfo : 'Chiave valori d''acquisto'
  ekwsl : String(4);
  @sap.label : 'Peso lordo'
  brgew : Decimal(13, 3);
  @sap.label : 'Peso netto'
  ntgew : Decimal(13, 3);
  @sap.label : 'Unità di peso'
  @sap.semantics : 'unit-of-measure'
  gewei : String(3);
  @sap.label : 'Volume'
  volum : Decimal(13, 3);
  @sap.label : 'Unità di volume'
  @sap.semantics : 'unit-of-measure'
  voleh : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Norma contenitore'
  behvo : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cond. di stoccaggio'
  @sap.quickinfo : 'Condizioni di stoccaggio'
  raube : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cond. temperatura'
  @sap.quickinfo : 'Codice per condizione temperatura'
  tempb : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Livello pianif. MRP'
  @sap.quickinfo : 'Livello pianificazione MRP'
  disst : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo di trasporto'
  tragr : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'N.sost.pericolosa'
  @sap.quickinfo : 'N. sostanza pericolosa'
  stoff : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Settore merceologico'
  spart : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Concorrente'
  kunnr : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice EAN'
  @sap.quickinfo : 'Codice EAN - obsoleto!!!!!'
  eannr : String(13);
  @sap.label : 'Qtà bolle EM'
  @sap.quickinfo : 'Qtà: determinazione numero bolle accompagnamento da stampare'
  wesch : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Regola approvv.'
  @sap.quickinfo : 'Regola approvvigionamento'
  bwvor : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fonte d''acquisto'
  @sap.quickinfo : 'Fonte acquisto'
  bwscl : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stagione'
  @sap.quickinfo : 'Categoria stagione'
  saiso : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di etichetta'
  etiar : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Modulo etichetta'
  etifo : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Campo disattivato'
  @sap.quickinfo : 'Disatt.'
  entar : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cd. EAN/UPC'
  @sap.quickinfo : 'Codice europeo articoli (EAN)'
  ean11 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo EAN'
  @sap.quickinfo : 'Tipo n. articoli europei'
  numtp : String(2);
  @sap.label : 'Lunghezza'
  laeng : Decimal(13, 3);
  @sap.label : 'Larghezza'
  breit : Decimal(13, 3);
  @sap.label : 'Altezza'
  hoehe : Decimal(13, 3);
  @sap.label : 'Unità di misura'
  @sap.quickinfo : 'Unità di misura per lungh./largh./altezza'
  @sap.semantics : 'unit-of-measure'
  meabm : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gerarchia prodotti'
  prdha : String(18);
  @sap.label : 'CCST net-change'
  @sap.quickinfo : 'Trasferimento stock calcolo costi net-change'
  aeklk : Boolean;
  @sap.label : 'Cd. CAD'
  @sap.quickinfo : 'Codice CAD'
  cadkz : Boolean;
  @sap.label : 'QM in approv. attivo'
  @sap.quickinfo : 'QM attivo nell''approvvigionamento'
  qmpur : Boolean;
  @sap.label : 'Peso imb. amm.'
  @sap.quickinfo : 'Peso di imballaggio ammesso'
  ergew : Decimal(13, 3);
  @sap.label : 'Unità di peso'
  @sap.quickinfo : 'Unità di peso (peso imballaggio ammesso)'
  @sap.semantics : 'unit-of-measure'
  ergei : String(3);
  @sap.label : 'Volume ammesso'
  @sap.quickinfo : 'Volume imballaggio ammesso'
  ervol : Decimal(13, 3);
  @sap.label : 'Unità volume'
  @sap.quickinfo : 'Unità di volume (volume imballaggio ammesso)'
  @sap.semantics : 'unit-of-measure'
  ervoe : String(3);
  @sap.label : 'Tolleranza peso ecc.'
  @sap.quickinfo : 'Tolleranza peso eccesso di HU'
  gewto : Decimal(3, 1);
  @sap.label : 'Toll. volume in ecc.'
  @sap.quickinfo : 'Tolleranza volume in eccesso della Handling Unit'
  volto : Decimal(3, 1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Utà OdA variab.'
  @sap.quickinfo : 'Unità di misura OdA variabile attiva'
  vabme : String(1);
  @sap.label : 'Liv.revis. assegnato'
  @sap.quickinfo : 'Cd.: livello revisione assegnato per il mat. in oggetto'
  kzrev : Boolean;
  @sap.label : 'Mat. configurabile'
  @sap.quickinfo : 'Materiale configurabile'
  kzkfg : Boolean;
  @sap.label : 'Gestione partite'
  @sap.quickinfo : 'Indicatore Obbligo di gestione a partita'
  xchpf : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo mat. imb.'
  @sap.quickinfo : 'Tipo materiale di imballaggio'
  vhart : String(4);
  @sap.label : 'Gr. riemp.'
  @sap.quickinfo : 'Grado riempimento (in base al volume)'
  fuelg : Decimal(3, 0);
  @sap.label : 'Fattore impilaggio'
  @sap.quickinfo : 'Fattore di impilaggio'
  stfak : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo mat. imb.'
  @sap.quickinfo : 'Gruppo materiali d''imballaggio'
  magrv : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gr. autorizzazioni'
  @sap.quickinfo : 'Gruppo autorizzazioni'
  begru : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Inizio validità'
  @sap.quickinfo : 'Data inizio validità'
  datab : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Fine validità'
  @sap.quickinfo : 'Data liquidazione'
  liqdt : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Esercizio stag.'
  saisj : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cat. gamma prezzo'
  @sap.quickinfo : 'CatGammaPrezzo'
  plgtp : String(2);
  @sap.label : 'Con dist. base vuoti'
  @sap.quickinfo : 'Cd.: distinta base vuoti'
  mlgut : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo merci esterno'
  extwg : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mat. config. gen.'
  @sap.quickinfo : 'Materiale configurabile gen.'
  satnr : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Categoria materiale'
  attyp : String(2);
  @sap.label : 'Co-prodotto'
  kzkup : Boolean;
  @sap.label : 'Materiale sost.'
  @sap.quickinfo : 'Codice: il materiale ha un materiale sostitutivo'
  kznfm : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mat. rif. prezzo'
  pmata : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato mat.x div'
  @sap.quickinfo : 'Stato materiale val. per tutte divisioni'
  mstae : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato per cat.distr.'
  @sap.quickinfo : 'Stato materiale valido per tutta la catena di distr.'
  mstav : String(2);
  @sap.display.format : 'Date'
  @sap.label : 'Inizio validità'
  @sap.quickinfo : 'Data inizio validità stato mat. valido per tutte le div.'
  mstde : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Inizio validità'
  @sap.quickinfo : 'Data inizio val. stato mat. valido per tutta la cat.distr.'
  mstdv : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Classific. fiscale'
  @sap.quickinfo : 'Classificazione fiscale materiale'
  taklv : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prof. catalogo'
  @sap.quickinfo : 'Profilo catalogo'
  rbnrm : String(9);
  @sap.label : 'Durata min. residua'
  mhdrz : Decimal(4, 0);
  @sap.label : 'Durata totale'
  mhdhb : Decimal(4, 0);
  @sap.label : 'Percentuale mag.'
  @sap.quickinfo : 'Percentuale magazzino'
  mhdlp : Decimal(3, 0);
  @sap.label : 'UM contenuto'
  @sap.quickinfo : 'Unità di misura contenuto'
  @sap.semantics : 'unit-of-measure'
  inhme : String(3);
  @sap.label : 'Cont. netto'
  inhal : Decimal(13, 3);
  @sap.label : 'Unità prz. confronto'
  @sap.quickinfo : 'Unità del prezzo di confronto'
  vpreh : Decimal(5, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gr. materiali etich.'
  @sap.quickinfo : 'Etichettatura sist. retail: gr. materiali (disatt. in 4.0)'
  etiag : String(18);
  @sap.label : 'Contenuti lordi'
  @sap.quickinfo : 'Contenuto lordo'
  inhbr : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Metodo di convers.'
  @sap.quickinfo : 'Metodo di conversione quantità'
  cmeth : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'N. oggetto int.'
  cuobf : String(18);
  @sap.label : 'Rilev. per l''amb.'
  @sap.quickinfo : 'Codice: rilevante per l''ambiente'
  kzumw : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Schema elab. quote'
  @sap.quickinfo : 'Elaborazione quote: schema di elaborazione quote'
  kosch : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prof. prezzo'
  @sap.quickinfo : 'Profilo prezzo per varianti'
  sprof : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sogg. sconto merce'
  @sap.quickinfo : 'Il materiale è soggetto allo sconto merce'
  nrfhg : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cod. comp. costr.'
  @sap.quickinfo : 'Codice componente costruttore'
  mfrpn : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Costruttore'
  @sap.quickinfo : 'Numero di un costruttore'
  mfrnr : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice mat. interno'
  @sap.quickinfo : 'Codice del materiale interno gestito in base a stock'
  bmatn : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ProfCompAssCostr'
  @sap.quickinfo : 'Prof. compon. ass. costr.'
  mprof : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Util. unità misura'
  @sap.quickinfo : 'Utilizzo/tipi di unità di misura'
  kzwsm : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Collezione'
  @sap.quickinfo : 'Collezione all''interno di una stagione'
  saity : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profilo codice MP'
  @sap.quickinfo : 'Profilo per codice merci pericolose'
  profl : String(3);
  @sap.label : 'Viscosità elevata'
  @sap.quickinfo : 'Codice: viscosità elevata'
  ihivi : Boolean;
  @sap.label : 'Merce sfusa/liquidi'
  @sap.quickinfo : 'Codice: merce sfusa/liquidi'
  iloos : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Liv. serializzazione'
  @sap.quickinfo : 'Livello di univocità del numero di serie'
  serlv : String(1);
  @sap.label : 'Chiuso'
  @sap.quickinfo : 'Materiale di imballaggio è un imballaggio chiuso'
  kzgvh : Boolean;
  @sap.label : 'Reg.part.autor.rich.'
  @sap.quickinfo : 'Registro partita autorizzato richiesto'
  xgchp : Boolean;
  @sap.label : 'Val. validità par.'
  @sap.quickinfo : 'Valutazione con parametro validità / sostituire n. modifica'
  kzeff : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Liv. appront.'
  @sap.quickinfo : 'Livello approntamento materiale'
  compl : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice periodo DS'
  @sap.quickinfo : 'Codice periodo per data scadenza'
  iprkz : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Regola arrot. DS'
  @sap.quickinfo : 'Regola arrotondamento per calcolo DS'
  rdmhd : String(1);
  @sap.label : 'Composizione prod.'
  @sap.quickinfo : 'Cd.: composizione prodotto indicata su imballaggio'
  przus : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gr. tipi pos. gen.'
  @sap.quickinfo : 'Gruppo di tipi di posizione generale'
  mtpos_mara : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Varianti log.'
  @sap.quickinfo : 'Materiale collettivo con varianti logistiche'
  bflme : String(1);
  @sap.label : 'Fisso'
  @sap.quickinfo : 'Il materiale è fisso'
  matfi : Boolean;
  @sap.label : 'Rilev. GC'
  @sap.quickinfo : 'Rilevante per la gestione della configurazione'
  cmrel : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo lista assort.'
  @sap.quickinfo : 'Tipo lista assortimento'
  bbtyp : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data di scad.'
  sled_bbd : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Variante EAN'
  @sap.quickinfo : 'Variante per Global Trade Item Number'
  gtin_variant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale collettivo'
  @sap.quickinfo : 'Codice mat. del materiale collettivo nei mat. preconf.'
  gennr : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mat. rif. norma imb.'
  @sap.quickinfo : 'Materiale di rif. per materiali imballati analogamente'
  rmatp : String(40);
  @sap.label : 'Rilevante per GDS'
  @sap.quickinfo : 'Indicatore: rilevante per global data synchronisation'
  gds_relevant : Boolean;
  @sap.label : 'Accettazione forn.'
  @sap.quickinfo : 'Accettazione all''origine'
  weora : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo HU standard'
  hutyp_dflt : String(4);
  @sap.label : 'A rischio di furto'
  pilferable : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cond. stocc. in mag.'
  @sap.quickinfo : 'Condizione stoccaggio magazzino'
  whstc : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Grp. mat. magazzino'
  @sap.quickinfo : 'Gruppo materiale magazzino'
  whmatgr : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indicatore handling'
  hndlcode : String(4);
  @sap.label : 'Rilev. sost. peric.'
  @sap.quickinfo : 'Rilevante per sost. peric.'
  hazmat : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo utà moviment.'
  @sap.quickinfo : 'Tipo di unità di movimentazione'
  hutyp : String(4);
  @sap.label : 'Peso netto var.'
  @sap.quickinfo : 'Peso netto variabile'
  tare_var : Boolean;
  @sap.label : 'Capacità massima'
  @sap.quickinfo : 'Capacità massima consentita del mat. d''imballaggio'
  maxc : Decimal(15, 3);
  @sap.label : 'Toll. capacità max.'
  @sap.quickinfo : 'Tolleranza capacità max. handling unit'
  maxc_tol : Decimal(3, 1);
  @sap.label : 'Lungh. imball. max.'
  @sap.quickinfo : 'Lunghezza imballaggio max. di un mat. d''imballaggio'
  maxl : Decimal(15, 3);
  @sap.label : 'Largh. imball. max.'
  @sap.quickinfo : 'Largh. imballaggio max. consentita di mat. d''imballaggio'
  maxb : Decimal(15, 3);
  @sap.label : 'Altezza imball. max.'
  @sap.quickinfo : 'Altezza imballaggio max. di mat. d''imballaggio'
  maxh : Decimal(15, 3);
  @sap.label : 'Unità di misura'
  @sap.quickinfo : 'Unità di mis. per lungh. /largh. /altezza max. d''imballaggio'
  @sap.semantics : 'unit-of-measure'
  maxdim_uom : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Paese/Reg. origine'
  @sap.quickinfo : 'Paese/Regione di origine del materiale (orig. non prefer.)'
  herkl : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gr.nolo mat.'
  @sap.quickinfo : 'Gruppo nolo materiale'
  mfrgr : String(8);
  @sap.label : 'Per. quarant.'
  @sap.quickinfo : 'Periodo di quarant.'
  qqtime : Decimal(3, 0);
  @sap.label : 'Unità di tempo'
  @sap.quickinfo : 'Unità di tempo per periodo di quarantena'
  @sap.semantics : 'unit-of-measure'
  qqtimeuom : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo ctrl. qualità'
  @sap.quickinfo : 'Gruppo di controllo qualità'
  qgrp : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profilo n.di serie'
  @sap.quickinfo : 'Profilo numero di serie'
  serial : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Nome del modulo'
  ps_smartform : String(30);
  @sap.label : 'UM Logistica'
  @sap.quickinfo : 'EWM-CW: unità di misura logistica'
  @sap.semantics : 'unit-of-measure'
  logunit : String(3);
  @sap.label : 'Ril. CW'
  @sap.quickinfo : 'CW EWM: il materiale è un materiale Catch Weight'
  cwqrel : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profilo CW'
  @sap.quickinfo : 'CW EWM: profilo Catch Weight per inserimento quantità CW'
  cwqproc : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gruppo tolleranza CW'
  @sap.quickinfo : 'Gruppo di tolleranza Catch Weight'
  cwqtolgr : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profilo adatt.'
  @sap.quickinfo : 'Profilo di adattamento'
  adprof : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Intell.Property'
  @sap.quickinfo : 'ID Intellectual Property (prodotto CRM)'
  ipmipproduct : String(40);
  @sap.label : 'Prezzo var. ammesso'
  @sap.quickinfo : 'Prezzo variante ammesso (in rifer. a anagrafica articolo)'
  allow_pmat_igno : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mezzo'
  medium : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Commodity'
  commodity : String(18);
  @sap.label : 'Origine animale'
  @sap.quickinfo : 'Ind.: contiene parti non tessili di origine animale'
  animal_origin : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Comp.tess.att.'
  @sap.quickinfo : 'Codice: nuova funzione composizione tessile'
  textile_comp_ind : String(1);
  @sap.label : 'Ora ultima modifica'
  @sap.quickinfo : 'Ora dell''ultima modifica'
  last_changed_time : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Rappresentazione esterna del codice materiale'
  matnr_external : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Indicatore di ril. per conform. chimica'
  chml_cmplnc_rlvnce_ind : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cat. mat. logistico'
  @sap.quickinfo : 'Categoria di un materiale logistico'
  logistical_mat_category : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'N. mat. vendita'
  @sap.quickinfo : 'Numero di un materiale di vendita'
  sales_material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo di tag'
  @sap.quickinfo : 'Tipo tag di identificazione'
  identification_tag_type : String(2);
  @sap.label : 'OID prodotto'
  @sap.quickinfo : 'Elemento dati per OID di prodotto'
  productoid : String(128);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato migrazione'
  @sap.quickinfo : 'Stato della migrazione dati automatica da tabella MARA'
  sdm_version : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Str. segm.'
  @sap.quickinfo : 'Struttura di segmentazione'
  sgt_csgr : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Strategia segm.'
  @sap.quickinfo : 'Strategia di segmentazione'
  sgt_covsa : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato segmentazione'
  @sap.quickinfo : 'Stato anagrafica materiale di segmentazione'
  sgt_stat : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Portata segm.'
  @sap.quickinfo : 'Portata di strategia di segmentazione'
  sgt_scope : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ril. segm.'
  @sap.quickinfo : 'Rilevante per segm.'
  sgt_rel : String(1);
  @sap.label : 'Altezza Utile Pezza'
  zz1_altezzautilepezza_prd : Decimal(15, 3);
  @sap.label : 'Altezza Ut Pezza UoM'
  @sap.quickinfo : 'Altezza Utile Pezza (Unit)'
  @sap.semantics : 'unit-of-measure'
  zz1_altezzautilepezza_prdu : String(3);
  @sap.label : 'Tipo Pelliccia'
  zz1_tipo_pelliccia_prd : String(1);
  @sap.label : 'Altezza Teor Pezza'
  @sap.quickinfo : 'Altezza Teorica Pezza'
  zz1_altezzateoricapezz_prd : Decimal(15, 3);
  @sap.label : 'Altezza Teor Pez UoM'
  @sap.quickinfo : 'Altezza Teorica Pezza (Unit)'
  @sap.semantics : 'unit-of-measure'
  zz1_altezzateoricapezz_prdu : String(3);
  @sap.label : 'Gola'
  zz1_gola_prd : String(18);
  @sap.label : 'Coda'
  zz1_coda_prd : String(18);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Dimensione Piatto'
  zz1_dimensione_piatto_prd : String(3);
  @sap.label : 'Lunghezza Teorica'
  zz1_lunghezzateorica_prd : Decimal(15, 3);
  @sap.label : 'Lunghezza Teoric UoM'
  @sap.quickinfo : 'Lunghezza Teorica (Unit)'
  @sap.semantics : 'unit-of-measure'
  zz1_lunghezzateorica_prdu : String(3);
  @sap.label : 'Kit'
  zz1_kit_value_prd : String(1);
  @sap.label : 'Titolo Filato'
  zz1_titolo_filato_prd : String(3);
  @sap.label : 'Grammatura'
  zz1_grammatura_prd : Decimal(15, 3);
  @sap.label : 'Grammatura UoM'
  @sap.quickinfo : 'Grammatura (Unit)'
  @sap.semantics : 'unit-of-measure'
  zz1_grammatura_prdu : String(3);
  @sap.label : 'Dichiarazione 3'
  zz1_dichiarazione3_prd : String(3);
  @sap.label : 'Contiene Pelle'
  zz1_contienepelle_prd : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Numero di fili'
  zz1_numerofili_prd : String(3);
  @sap.label : 'Piuma'
  zz1_piuma_prd : Boolean;
  @sap.label : 'Materiale Critico'
  zz1_materialecritico_prd : Boolean;
  @sap.label : 'Business Line'
  zz1_businessline_prd : String(5);
  @sap.label : 'Codice Terzista Prod'
  @sap.quickinfo : 'Codice Terzista Produzione'
  zz1_codiceterzistaprod_prd : String(10);
  @sap.label : 'Lavorazione'
  zz1_lavorazione_prd : String(5);
  @sap.label : 'Water Resistant'
  zz1_water_resistant_prd : String(1);
  @sap.label : 'Spessore Pellame'
  zz1_spessorepellame_prd : Decimal(15, 3);
  @sap.label : 'Spessore Pellame UoM'
  @sap.quickinfo : 'Spessore Pellame (Unit)'
  @sap.semantics : 'unit-of-measure'
  zz1_spessorepellame_prdu : String(3);
  @sap.label : 'Terzista Campionario'
  zz1_terzistacampionari_prd : String(10);
  @sap.label : 'Tipo Gestione'
  zz1_tipo_gestione_prd : String(1);
  @sap.label : 'Punto'
  zz1_punto_prd : String(3);
  @sap.label : 'Flag Gestione Fiscal'
  @sap.quickinfo : 'Flag Gestione Fiscale'
  zz1_flag_gest_fiscale_prd : String(1);
  @sap.label : 'Numero Lavaggio'
  zz1_numerolavaggio_prd : String(5);
  @sap.label : 'Contiene Pelliccia'
  zz1_contienepelliccia_prd : String(1);
  @sap.label : 'Business Unit'
  zz1_businessunit_prd : String(5);
  @sap.label : 'Tipo Struttura'
  zz1_tipostruttura_prd : String(5);
  @sap.label : 'Codice Terzista Prot'
  @sap.quickinfo : 'Codice Terzista Prototipia'
  zz1_codiceterzistaprot_prd : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Numero caratt. int.'
  @sap.quickinfo : 'Numero caratteristica interna nelle caratt. dei colori'
  color_atinn : String(30);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Numero caratt. int.'
  @sap.quickinfo : 'N. caratt. interna nelle caratt. per le dimens. principali'
  size1_atinn : String(30);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Numero caratt. int.'
  @sap.quickinfo : 'N. caratt. interna nelle caratt. delle seconde dimensioni'
  size2_atinn : String(30);
  @sap.label : 'Colore'
  @sap.quickinfo : 'Valore caratteristica per colori in caso di varianti'
  color : String(18);
  @sap.label : 'Dimensione princ.'
  @sap.quickinfo : 'Valore caratteristica per la dimens. princ. nelle varianti'
  size1 : String(18);
  @sap.label : 'Seconda dimensione'
  @sap.quickinfo : 'Valore caratt. per la seconda dimensione nelle varianti'
  size2 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Articolo Proj'
  zzproj : String(7);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Desc. Articolo Proj'
  @sap.quickinfo : 'Descrizione Articolo Proj'
  zzprojdesc : String(50);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Macro Business'
  zzmacrobusi : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business'
  zzbusi : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Category'
  zzcategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Segmento'
  zzsubsegm : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Colore'
  zzcolor : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Linea'
  zzlinea : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Produzioni Speciali'
  zzprodspec : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Famiglia'
  zzfamiglia : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Classe'
  zzclasse : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sub Category'
  zzsubclasse : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Macro Tipo'
  zzmacrotipo : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Modello Commerciale'
  zzmodcomm : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale Commerc.'
  @sap.quickinfo : 'Tessuto Commerciale'
  zztescomm : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cites'
  zzcites : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dichiarazioni'
  zzdichi : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mid Code Usa'
  zzmidusa : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stitching'
  zzstitching : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Package'
  zzpackage : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Genere'
  zzgenere : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Disposizione'
  zzdispo : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Composizione Princ.'
  @sap.quickinfo : 'Tipologia Composizione Principale'
  zztipocomp : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcodecomp : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scalarino/TG/Taglia'
  zztaglia : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Descrizione Taglia'
  zztagliadesc : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sale Code'
  zzobsoleto : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Occasione d''uso'
  zzuso : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Top/Bottom'
  zztopbot : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Articolo Gemello'
  zzmatgm : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon01 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos01 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon02 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos02 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon03 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos03 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon04 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos04 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon05 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos05 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon06 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos06 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon07 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos07 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon08 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos08 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon09 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos09 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon10 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos10 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon11 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos11 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon12 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos12 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon13 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos13 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon14 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos14 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Componente'
  zzcompon15 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Codice Composizione'
  zzcompos15 : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Origine preferenz.'
  @sap.quickinfo : 'Origine preferenziale'
  zzop : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Design Flow'
  zzdesignflow : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Macro Category'
  zzmacrocategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Birth Date Year'
  zzbirthdate_year : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Birth Date Season'
  zzbirthdate_season : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo Impasto'
  zzimpasto : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tipo Tintura'
  zztipotintura : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cimossa articolo'
  @sap.quickinfo : 'Cimossa dell''articolo'
  zzcodice5std : String(8);
  @sap.label : 'Peso Finito Min.'
  @sap.quickinfo : 'Peso Finito Minimo'
  zzpesfinmin : Decimal(13, 3);
  @sap.label : 'Peso Fin. Max'
  @sap.quickinfo : 'Peso Finito Max'
  zzpesfinmax : Decimal(13, 3);
  @sap.label : 'Peso Finito Reale'
  zzpesfinreale : Decimal(13, 3);
  @sap.label : 'Peso Finito GR/MQ'
  zzpesfinitogrmq : Decimal(13, 3);
  @sap.label : 'Altezza Finita MIN'
  zzaltfinmin : Decimal(13, 3);
  @sap.label : 'Altezza Finita MAX'
  zzaltfinmax : Decimal(13, 3);
  @sap.label : 'Altezza Utile'
  zzaltutile : Decimal(13, 3);
  @sap.label : 'Tipo Confezione'
  @sap.semantics : 'unit-of-measure'
  zztipconf : String(3);
  @sap.label : 'di'
  @sap.quickinfo : 'Quantità Confezione'
  zzqtconf : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Finezza Filati'
  zzfinezzafil : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Finezza Fibre'
  zzfinezzafibre : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 1'
  @sap.quickinfo : 'Classificazione Tecnica 1'
  zzclastech1 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 2'
  @sap.quickinfo : 'Classificazione Tecnica 2'
  zzclastech2 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 3'
  @sap.quickinfo : 'Classificazione Tecnica 3'
  zzclastech3 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 4'
  @sap.quickinfo : 'Classificazione Tecnica 4'
  zzclastech4 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 5'
  @sap.quickinfo : 'Classificazione Tecnica 5'
  zzclastech5 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 6'
  @sap.quickinfo : 'Classificazione Tecnica 6'
  zzclastech6 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 7'
  @sap.quickinfo : 'Classificazione Tecnica 7'
  zzclastech7 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. 1 per Listino'
  @sap.quickinfo : 'Classificazione Tecnica 8'
  zzclastech8 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 9'
  @sap.quickinfo : 'Classificazione Tecnica 9'
  zzclastech9 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 10'
  @sap.quickinfo : 'Classificazione Tecnica 10'
  zzclastech10 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Classif. Fatt. 1'
  @sap.quickinfo : 'Classificazione Fatturazione 1'
  zzclasfattes1 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Classif. Fatt. 2'
  @sap.quickinfo : 'Classificazione Fatturazione 2'
  zzclasfattes2 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Classif. Fatt. 3'
  @sap.quickinfo : 'Classificazione Fatturazione 3'
  zzclasfattes3 : String(3);
  @sap.label : 'Made in LP'
  @sap.quickinfo : 'Made in LoroPiana'
  zzmade_loropiana : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Famiglia'
  @sap.quickinfo : 'Famiglia Prodotto SAP'
  zzfamigliasapgenerico : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 1'
  @sap.quickinfo : 'Classificazione Commerciale 1'
  zzclascomm1 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 2'
  @sap.quickinfo : 'Classificazione Commerciale 2'
  zzclascomm2 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 3'
  @sap.quickinfo : 'Classificazione Commerciale 3'
  zzclascomm3 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 4'
  @sap.quickinfo : 'Classificazione Commerciale 4'
  zzclascomm4 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 5'
  @sap.quickinfo : 'Classificazione Commerciale 5'
  zzclascomm5 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 6'
  @sap.quickinfo : 'Classificazione Commerciale 6'
  zzclascomm6 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 7'
  @sap.quickinfo : 'Classificazione Commerciale 7'
  zzclascomm7 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 8'
  @sap.quickinfo : 'Classificazione Commerciale 8'
  zzclascomm8 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Commerciale 9'
  @sap.quickinfo : 'Classificazione Commerciale 9'
  zzclascomm9 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class.Commerciale 10'
  @sap.quickinfo : 'Classificazione Commerciale 10'
  zzclascomm10 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Impasto Teorico'
  zzimpastoteorico : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fondo'
  zzfondo : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bunch'
  zzbunch : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Numero Pagina'
  zzpagina : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Gradino'
  zzgradino : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sequenza'
  zzsequenza : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Colore Costo'
  zzcolorecosto : String(50);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stagione Stato'
  @sap.quickinfo : 'Stagione cambio Stato Articolo'
  zzstagstato : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Utente Stato'
  @sap.quickinfo : 'Utente modifica Stato'
  zzutestato : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Utente agg. ERP'
  @sap.quickinfo : 'Utente aggiornamento ERP'
  zzutevariaz : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Data agg. ERP'
  @sap.quickinfo : 'Data aggiornamento ERP'
  zzdatavariaz : Date;
  @sap.label : 'Flag Marchio'
  zzflagmarchio : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Classe 1 val. Art.'
  @sap.quickinfo : 'Classe 1 valutazione Articolo'
  zzclassval1 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Class. Tecnica 12'
  @sap.quickinfo : 'Classificazione Tecnica 12'
  zzclasstech12 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Variante GB18401'
  zzvariantegb : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : '2°Class. per Listino'
  @sap.quickinfo : '2° Classificazione per Listino'
  zzclasslisvend2 : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'ID Barcode'
  @sap.quickinfo : 'BARCODE Articolo'
  zzbarcode : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'ID Art. Comm.'
  @sap.quickinfo : 'ID Interno per Articoli Commerciali'
  zzidgeartco : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dichiar. 2'
  @sap.quickinfo : 'Dichiarazione 2'
  zzdich2 : String(3);
  @sap.label : 'Pelliccia'
  zzfur : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Infiammabile'
  zzflammable : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ownership'
  zzownership : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Categoria di Vendita'
  zzsalescat : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Colore NRF'
  zznrfcol : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Famiglia Colore'
  zzfamily_col : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato Ciclo di vita'
  zzlifecycstatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stato Fisico'
  zzphisicalstat : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Knitted / Woven'
  zzknitted : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Royalty'
  zzroyalty : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Trattamento'
  @sap.quickinfo : 'Codice Trattamento Commerciale'
  zzcomm_trat : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'End of Life'
  zzendoflife : String(10);
  @sap.label : 'Codice NRF Taglia'
  @sap.quickinfo : 'Taglia NRF'
  zznrftg : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'C.Vita ESSENZIALI'
  @sap.quickinfo : 'Ciclo di vita ESSENZIALI'
  zzesslifecycle : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fase Nasc ESSENZIALI'
  @sap.quickinfo : 'Fase Nascita ESSENZIALI'
  zzessphase : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prog. Maglieria'
  @sap.quickinfo : 'Programma Maglieria'
  zzknitted_prog : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'N° parti fattura'
  @sap.quickinfo : 'Numero parti in fattura'
  zzpartsinv : String(5);
};

