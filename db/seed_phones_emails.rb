def seed_phones_emails
	lines = @list.split("\n")
	lines.each do |line|
		name = line.split("\t")[1]
		first = name.split(",")[1].strip 
		second = name.split(",")[0].strip 

		# puts first + second

		player = Player.find_by(first_name: first, last_name: second)
		# puts player.inspect
		player.phone_number = line.split("\t")[5]
		player.email = line.split("\t")[6]
		player.save
	end
end




@list  = "1	Baird, Mike	Mike			713-817-3950	mikebaird99@hotmail.com	Y
2	Bane, Don	Don			832-580-6802	donwaba@att.net	Y
3	Berberich, Steve	Steve			937-239-5135	sjberberich@icloud.com	
4	Caldwell, Mark	Mark			703-732-3311	Mark@markcaldwell.com	
5	Contreras, Alfonso				346-857-3004	alcon7000@hotmail.com	
6	DiValerio, Randy	Randy		281-470-3377	281-685-5084	Randy.DiValerio@yahoo.com	Y
7	Dolittle, Don				612-237-0798	donalddoo@gmail.com	
8	Flores, Ruben	Ruben			832-818-3270	ruflosa@sbcglobal.net	N
9	Good, David	David	281-486-8735	281-204-1233	281-731-8735	harosho@hal-pc.org	
10	Gundling, Jeremy	Jeremy			832-814-5638	gundlings@gmail.com	
11	Hebert, Don	Don	281-998-7249	281-471-4611	281-413-5873	drhebert@ips.us	Y
12	Houvouras, Terry	Terry	281-481-1289	713-924-1790	281-686-0518	texmexhouvouras@msn.com	Y
13	Nguyen, Hung	Hung			832-754-8979	htannguyen70@gmail.com	
14	Johnson, Doug	Doug			713-254-0658	dohjohnson@earthlink.net	
15	Kamana, Srini	Srini			713-385-1936	skamanawho@gmail.com	Y
16	Khandheria, Joe	Joe			832-413-4287	jawahar@hotmail.com	
17	Martin, Bob				713-924-8292	bobmartin1946@yahoo.com	
18	McBride, John	John			832-221-0820	john.mcbride@arkema.com	
19	Moza, Ashok	Ashok			281-772-4408	akm@chemicalsinc.com	
20	Murray, Clay	Clay			786-223-3203	cmurray272@yahoo.com	
21	Munday, Steve	Steve			281-435-3331	stephen.r.munday@nasa.gov	N
22	Neale, Jeff	Jeff	281-291-7930	281-576-5000	713-829-8284	jneale3@comcast.net	
23	Patel, Kirit	Kirit			832-221-9322	patelkm0603@yahoo.com	
24	Purdum, David				281-910-9698	dnpurdum@gmail.com	
25	Quinlan, John	John		713-845-5386	832-226-3930	john.quinlan75@yahoo.com	
26	Rodriguez, Alex	Alex	281-474-5913		832-721-0639	c100950@aol.com	Y
27	Sankaran, Subra	Subra			281-323-0275	subra_sankaran@yahoo.com	Y
28	Sapp, Chris	Chris			832-545-8236	chrissapp@allstate.com	
29	Tongol, Francis	Francis	281-338-2804		281-840-9403	francis@tongol.com	Y
30	Su, Yi	Yi			281-684-2037	yi_su07@yahoo.com	
31	Trevino, Oscar	Oscar			713-922-5781	oscarbtrevino49@gmail.com	
32	Tyler, Terry				832-803-2950	terry@tntprop.us	N
33	Walsh, Martin				713-553-7759	martinwalsh007@gmail.com	
34	Wilson, Larry	Larry	281-280-8577		832-372-8222	lswtexas@hotmail.com	Y
35	Zachry, Earl				281-435-3292	ewzachry@msn.com	
36	Zeller, Kurt	Kurt			832-454-2514	zeller5@sbcglobal.net"



