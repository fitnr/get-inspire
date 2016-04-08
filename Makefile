SHELL = bash
BASE = http://data.inspire.landregistry.gov.uk
PLACES = Abertawe_-_Swansea Adur Allerdale Amber_Valley Arun Ashfield Ashford \
  Aylesbury_Vale Babergh Barking_and_Dagenham Barnet Barnsley Barrow-in-Furness \
  Basildon Basingstoke_and_Deane Bassetlaw Bath_and_North_East_Somerset Bedford \
  Bexley Birmingham Blaby Blackburn_with_Darwen Blackpool \
  Blaenau_Gwent_-_Blaenau_Gwent Bolsover Bolton Boston Bournemouth \
  Bracknell_Forest Bradford Braintree Breckland Brent Brentwood Broadland Bromley \
  Bromsgrove Broxbourne Broxtowe Burnley Bury Caerdydd_-_Cardiff \
  Caerffili_-_Caerphilly Calderdale Cambridge Camden Cannock_Chase Canterbury \
  Carlisle Casnewydd_-_Newport Castell-nedd_Port_Talbot_-_Neath_Port_Talbot \
  Castle_Point Central_Bedfordshire Charnwood Chelmsford Cheltenham Cherwell \
  Cheshire_East Cheshire_West_and_Chester Chesterfield Chichester Chiltern \
  Chorley Christchurch City_of_Bristol City_of_Derby City_of_Kingston_upon_Hull \
  City_of_Leicester City_of_London City_of_Nottingham City_of_Peterborough \
  City_of_Plymouth City_of_Portsmouth City_of_Southampton City_of_Stoke-on-Trent \
  City_of_Westminster City_of_Wolverhampton Colchester Conwy_-_Conwy Copeland \
  Corby Cornwall Cotswold County_Durham County_of_Herefordshire Coventry Craven \
  Crawley Croydon Dacorum Darlington Dartford Daventry Derbyshire_Dales Doncaster \
  Dover Dudley Ealing East_Cambridgeshire East_Devon East_Dorset East_Hampshire \
  East_Hertfordshire East_Lindsey East_Northamptonshire East_Riding_of_Yorkshire \
  East_Staffordshire Eastbourne Eastleigh Eden Elmbridge Enfield Epping_Forest \
  Epsom_and_Ewell Erewash Exeter Fareham Fenland Forest_Heath Forest_of_Dean \
  Fylde Gateshead Gedling Gloucester Gosport Gravesham Great_Yarmouth Greenwich \
  Guildford Gwynedd_-_Gwynedd Hackney Halton Hambleton Hammersmith_and_Fulham \
  Harborough Haringey Harlow Hartlepool Harrogate Harrow Hart Hastings Havant \
  Havering Hertsmere High_Peak Hillingdon Hinckley_and_Bosworth Horsham Hounslow \
  Huntingdonshire Hyndburn Ipswich Isle_of_Wight Isles_of_Scilly Islington \
  Kensington_and_Chelsea Kettering Kings_Lynn_and_West_Norfolk \
  Kingston_upon_Thames Kirklees Knowsley Lambeth Lancaster Leeds Lewes Lewisham \
  Lichfield Lincoln Liverpool Luton Maidstone Maldon Malvern_Hills Manchester \
  Mansfield Medway Melton Mendip Merthyr_Tudful_-_Merthyr_Tydfil Merton Mid_Devon \
  Mid_Suffolk Mid_Sussex Middlesbrough Milton_Keynes Mole_Valley New_Forest \
  Newark_and_Sherwood Newcastle-under-Lyme Newcastle_upon_Tyne Newham North_Devon \
  North_Dorset North_East_Derbyshire North_East_Lincolnshire North_Hertfordshire \
  North_Kesteven North_Lincolnshire North_Norfolk North_Somerset North_Tyneside \
  North_Warwickshire North_West_Leicestershire Northampton Northumberland Norwich \
  Nuneaton_and_Bedworth Oadby_and_Wigston Oldham Oxford Pendle \
  Pen-y-bont_ar_Ogwr_-_Bridgend Preston Poole Powys_-_Powys Purbeck Reading \
  Redbridge Redcar_and_Cleveland Redditch Reigate_and_Banstead \
  Rhondda_Cynon_Taf_-_Rhondda_Cynon_Taf Ribble_Valley Richmond_upon_Thames \
  Richmondshire Rochdale Rochford Rossendale Rother Rotherham Rugby Runnymede \
  Rushcliffe Rushmoor Rutland Ryedale Salford Sandwell Scarborough Sedgemoor \
  Sefton Selby Sevenoaks Sheffield Shepway Shropshire Sir_Benfro_-_Pembrokeshire \
  Sir_Ceredigion_-_Ceredigion Sir_Ddinbych_-_Denbighshire \
  Sir_Fynwy_-_Monmouthshire Sir_Gaerfyrddin_-_Carmarthenshire \
  Sir_y_Fflint_-_Flintshire Sir_Ynys_Mon_-_Isle_of_Anglesey Slough Solihull \
  South_Bucks South_Cambridgeshire South_Derbyshire South_Gloucestershire \
  South_Hams South_Holland South_Kesteven South_Lakeland South_Norfolk \
  South_Northamptonshire South_Oxfordshire South_Ribble South_Somerset \
  South_Staffordshire South_Tyneside_District Southend-on-Sea Southwark \
  Spelthorne St._Albans St._Edmundsbury St._Helens Stafford \
  Staffordshire_Moorlands Stevenage Stockport Stockton-on-Tees Stratford-on-Avon \
  Stroud Suffolk_Coastal Sunderland Surrey_Heath Sutton Swale Swindon Tameside \
  Tamworth Tandridge Taunton_Deane Teignbridge Telford_and_Wrekin Tendring \
  Test_Valley Tewkesbury Thanet The_City_of_Brighton_and_Hove Three_Rivers \
  Thurrock Tonbridge_and_Malling Tor-faen_-_Torfaen Torbay Torridge Tower_Hamlets \
  Trafford Tunbridge_Wells Uttlesford Vale_of_Glamorgan Vale_of_White_Horse \
  Wakefield Walsall Waltham_Forest Wandsworth Warrington Warwick Watford Waveney \
  Waverley Wealden Wellingborough Welwyn_Hatfield West_Berkshire West_Devon \
  West_Dorset West_Lancashire West_Lindsey West_Oxfordshire West_Somerset \
  Weymouth_and_Portland Wigan Wiltshire Winchester Windsor_and_Maidenhead Wirral \
  Woking Wokingham Worcester Worthing Wrecsam_-_Wrexham Wychavon Wycombe \
  Wyre_Forest Wyre York  

.PHONY: all geojsons shps
all: $(foreach x,$(PLACES),gml/$x.gml)
geojsons: $(foreach x,$(PLACES),geojson/$x.geojson)
shps: $(foreach x,$(PLACES),shp/$x.shp)

geojson/%.geojson: gml/%.gml | geojson
	ogr2ogr -f GeoJSON $@ $< -s_srs EPSG:27700 -t_srs EPSG:4326

shp/%.shp: gml/%.gml | shp
	ogr2ogr -f 'ESRI Shapefile' $@ $<

gml/%.gml: zip/%.zip | gml
	unzip -p $< '*.gml' > $@

# e.g. http://data.inspire.landregistry.gov.uk/Abertawe_-_Swansea.zip
zip/%.zip: | zip
	curl -o $@ $(BASE)/$(@F)

geojson gml shp zip:; -mkdir $@
