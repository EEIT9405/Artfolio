use ARTFOLIO 
go

INSERT INTO tb_member (pwd, name, email, gender, mphoto) VALUES ('123', '保', 'a', 1,'/memberPhoto/user.png');
INSERT INTO tb_member (pwd, name, email, gender, mphoto) VALUES ('123', '程', 'b', 1,'/memberPhoto/user.png');
INSERT INTO tb_member (pwd, name, email, gender, mphoto) VALUES ('123', '庭', 'c', 1,'/memberPhoto/user.png');


INSERT INTO tb_bounty 
(mid, 
 b_state,
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
5,
1, 
'2017世界機器人大賽-RoboCom青少年挑戰賽', 

'力求通過此次比賽，使智慧型機器人應用，增材製造等與智慧未來相關的教育深入青少年的學習生活中，為青少年的創造力、創新力提供一個更廣闊的平臺，向夢想揚帆起航。
RoboCom2017 青少年挑戰賽之台灣賽區介紹
RoboCom 青少年挑戰賽是國際性青少年機器人賽事，也是 RoboCom 品牌國際公開 賽的首項賽事。RoboCom 青少年挑戰賽之台灣分區賽屬 RoboCom 的重要賽事，由台灣地 區組委會聯手推動，促進兩岸的文化教育交流，讓兩岸的青少年得到知識和想法上的互 動與交流，推動兩岸的教育文化的互通，優秀資源的共用，以舉辦此活動大賽，創新與 挑戰並存。', 
'RoboCom2017 台灣分區賽決賽
比賽時間： 預賽及練習賽：2017 年 07 月 25 日 13:00-17:00
決賽：2017 年 07 月 26 日 08:00-18:00
RoboCom2017 台灣分區賽決賽地點：臺北科技大學
地址：臺北市大安區忠孝東路三段 1 號 
RoboCom2017 台灣分區賽決賽主題：智慧日月潭 
RoboCom2017 台灣分區賽決賽評選出 12 隊優勝隊伍參加北京總決賽。
詳細決賽介紹請至 RoboCom2017 台灣分區賽決賽規則章節查看。
決賽前一天為練習賽，練習賽期間參賽選手可使用練習比賽推薦配套設備 及熟悉比賽場地。 
每隊報名費用新台幣 1200 元，比賽專用小車加購價新台幣 2980 元。
RoboCom 青少年挑戰賽總決賽 ',

'技嘉教育基金',
0, 
0, 
'2017-05-26 16:18:00', 
'2017-06-26 16:18:00',
'2017-08-27 16:18:00',
'C:/Artfolio/BountyImgs/10.jpg',
'C:/Artfolio/BountyImgs/10.jpg',
8411);

insert into b_tag (b_id, b_tag) values(1,'機器人')
insert into b_tag (b_id, b_tag) values(1,'產品設計')
insert into b_tag (b_id, b_tag) values(1,'其他')
insert into b_tag (b_id, b_tag) values(1,'設計')


INSERT INTO tb_bounty 
(mid, 
 b_state,
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
5,
2, 
'ISCA大阪國際學生創作節', 

'技嘉科技創立於1986年，以前瞻性的眼光與優越的產品屢創佳績，邁入新世紀之際，本著「創新科技、美化人生」之理念，成立了技嘉教育基金會，以推動科技教育、藝術人文、創造和諧進步之社會為發展宗旨；鑑於優質的設計對資訊產品的重要及附加價值，期藉由此設計大賽，提升國內資訊產品設計能力，及為未來即將成為設計師的學生提供一最佳實務訓練經驗。', 

'參賽作品須知
請先上技嘉教育基金會網站 www.gigabyte.org.tw 註冊報名。
所有參賽作品須符合本競賽辦法之規定，包含設計可行性，作品展示規格與送件時間等，否則不予評審。
初賽繳交資料：
請於2016年12月20日﹝二﹞下午11:00前將作品裱板上傳至「奇想設計大賽」官網。上傳檔案前自行壓縮，單一圖檔勿超過2MB，上傳檔案格式為(JPG，PNG，BMP，GIF)，橫式，寬1190 X 高840 像素(px)。(請自行保留原始檔案)
裱板最多4張為限，請依順序(第一張、第二張…)上傳。裱板內容可自由發揮，但必須為橫式，並包含下述項目：
主要概念與特色。
平面圖：含尺寸及配置平面圖與外觀彩現圖。
文字說明：內容應包括設計理念與策略，材料說明、使用場合、對象與創作特點等。
裱板正面不可出現設計者姓名等任何相關文字﹝姓名請註明於裱板背面報名表內﹞。',

'技嘉教育基金',
500000, 
300000, 
'2017-06-02 14:37:00', 
'2017-08-31 14:37:00',
'2017-10-15 14:37:00',
'C:/Artfolio/BountyImgs/7.jpg',
'C:/Artfolio/BountyImgs/7.jpg',
2312);

insert into b_tag (b_id, b_tag) values(2,'創作')
insert into b_tag (b_id, b_tag) values(2,'平面設計')
insert into b_tag (b_id, b_tag) values(2,'企劃')
insert into b_tag (b_id, b_tag) values(2,'設計')


INSERT INTO tb_bounty 
(mid, 
 b_state,
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
5,
2, 
'2017 南投縣玉山美術獎', 

'南投縣山高水長風景明媚，是藝術家創作的最佳環境，特舉辦玉 
山美術獎，旨在促進本縣藝術文化特色，並帶動本縣藝文邁向全 
國化乃至國際化，引導全國人士體驗南投文化，期透過活動鼓勵美術創作，倡導藝文風氣推展全民美育，提升藝術創作水準。', 

'南投縣山高水長風景明媚，是藝術家創作的最佳環境，特舉辦玉 
山美術獎，旨在促進本縣藝術文化特色，並帶動本縣藝文邁向全 
國化乃至國際化，引導全國人士體驗南投文化，期透過活動鼓勵美術創作，倡導藝文風氣推展全民美育，提升藝術創作水準。',

'南投縣政府 ',
780000, 
100000, 
'2017-06-02 17:12:00', 
'2017-06-30 17:00:00',
'2017-09-15 17:12:00',
'C:/Artfolio/BountyImgs/8.jpg',
'C:/Artfolio/BountyImgs/8.jpg',
5351);

insert into b_tag (b_id, b_tag) values(3,'創作')
insert into b_tag (b_id, b_tag) values(3,'平面設計')
insert into b_tag (b_id, b_tag) values(3,'攝影')
insert into b_tag (b_id, b_tag) values(3,'設計')
insert into b_tag (b_id, b_tag) values(3,'美術')


INSERT INTO tb_bounty 
(mid, 
 b_state,
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
5,
0, 
'106年「舊是愛鐵橋」微電影拍攝競賽', 

'南投縣山高水長風景明媚，是藝術家創作的最佳環境，特舉辦玉 
山美術獎，旨在促進本縣藝術文化特色，並帶動本縣藝文邁向全 
國化乃至國際化，引導全國人士體驗南投文化，期透過活動鼓勵美術創作，倡導藝文風氣推展全民美育，提升藝術創作水準。', 

'南投縣山高水長風景明媚，是藝術家創作的最佳環境，特舉辦玉 
山美術獎，旨在促進本縣藝術文化特色，並帶動本縣藝文邁向全 
國化乃至國際化，引導全國人士體驗南投文化，期透過活動鼓勵美術創作，倡導藝文風氣推展全民美育，提升藝術創作水準。',

'南投縣政府 ',
61000, 
30000, 
'2017-06-11 21:20:00', 
'2017-06-30 21:20:00',
'2017-09-15 21:20:00',
'C:/Artfolio/BountyImgs/9.jpg',
'C:/Artfolio/BountyImgs/9.jpg',
15724);

insert into b_tag (b_id, b_tag) values(4,'創作')
insert into b_tag (b_id, b_tag) values(4,'影片')
insert into b_tag (b_id, b_tag) values(4,'攝影')
insert into b_tag (b_id, b_tag) values(4,'設計')



INSERT INTO tb_bounty 
(mid,
 b_state, 
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
4,
0, 
'2017青春尬歌-校園原創音樂徵選大賽', 
'為培育高雄在地流行音樂人才，鼓勵青年學子勇於創作並提供其登台表演展現自我機會', 

'一、為培育高雄在地流行音樂人才，鼓勵青年學子勇於創作並提供其登台表演展現自我機會，高雄市政府文化局特辦理「2017青春尬歌」系列活動，活動包含「校園原創音樂徵選大賽」及「校園原創音樂紀念合輯錄製」。
二、校園原創音樂徵選大賽分初審、複賽、及決賽三階段辦理。即日起至106(本)年7月24日止受理高中職以上各學校之在校學生或於1994年後(含1994年)出生者所組成之樂團繳交原創音樂DEMO帶，由本局聘請專業流行音樂人士擔任評審，於8月10日公佈初審入圍名單。初審入圍者再於8月14日以LIVE演出方式進行複賽，由評審評選6組樂團晉級決賽。決賽將於11月11日假駁二藝術特區LIVE WAREHOUSE月光劇場舉行，當日除公佈名次及頒發獎金外，也將邀請知名獨立樂團擔任表演嘉賓，提供交流觀摩機會，傳承原創音樂精神。
三、本活動最高獎金新台幣4萬5,000元整，晉級決賽之6組樂團更能進入專業錄音室錄製合輯，決賽當天開放民眾免費索票入場觀賞，完整提供青年學子音樂夢想舞台。
四、檢附活動宣傳DM、簡章、及報名表。',

'駁二藝術特區LIVE WAREHOUSE',
110000, 
35000, 
'2017-06-15 16:16:00', 
'2017-07-24 17:00:00',
'2017-08-10 17:00:00',
'C:/Artfolio/BountyImgs/11.jpg',
'C:/Artfolio/BountyImgs/11.jpg',
205);

insert into b_tag (b_id, b_tag) values(5,'創作')
insert into b_tag (b_id, b_tag) values(5,'影片')
insert into b_tag (b_id, b_tag) values(5,'攝影')
insert into b_tag (b_id, b_tag) values(5,'設計')
insert into b_tag (b_id, b_tag) values(5,'音樂')
insert into b_tag (b_id, b_tag) values(5,'徵才')


INSERT INTO tb_bounty 
(mid, 
 b_state,
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
5,
0, 
'2017 為耶穌歌唱 Sing 4 Jesus', 

'活動宗旨
透過本活動期盼鼓勵海內外華人之音樂事奉團隊，善用音樂向外佈道。並建立詩歌創作及合唱的觀摩平台，帶出基督信仰的見證和告白，亦提倡『尊重著作權』概念，期待各地團隊一起學習，互相激勵。
', 

'比賽組別
合唱組以四人以上的基督徒團隊，呈現四部合唱的歌曲
創作組 創作以基督信仰為創作本質，曲風不限',

'財團法人台北市基督教救世傳播協會',
270000, 
100000, 
'2017-06-06 13:16:00', 
'2017-07-15 23:59:00',
'2017-07-31 12:00:00',
'C:/Artfolio/BountyImgs/12.jpg',
'C:/Artfolio/BountyImgs/12.jpg',
1211);


insert into b_tag (b_id, b_tag) values(6,'創作')
insert into b_tag (b_id, b_tag) values(6,'音樂')
insert into b_tag (b_id, b_tag) values(6,'耶穌')
insert into b_tag (b_id, b_tag) values(6,'基督')
insert into b_tag (b_id, b_tag) values(6,'合唱')



INSERT INTO tb_bounty 
(mid, 
 b_state,
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
4, 
1,
'2017臺北文創天空創意節', 

'百萬製作費 幫你圓夢提供製作費用：製作費將分為新台幣100萬、50萬、及30萬等3組，由各組報名者中選出一名優選，分別提供新台幣100萬、50萬、及30萬製作經費，報名時須選定投件組別。
好點子獎金：於參賽作品中，挑選十組作品，頒發鼓勵獎金新台幣5,000元。（三組優選與好點子獎金，不重複獲選）。展演場地使用：於主辦單位指定時間，無償使用臺北文創文化廣場。
製作諮詢指導：由專家提供予創作建議及諮詢，幫助入選者提案付諸實現。作品曝光行銷：自入選公告後，協助入選者將創作歷程紀錄及宣傳，並於年底舉辦聯合發表活動「臺北文創天空創意節」，實體及網路宣傳並進。', 

'多元繽紛的數位時代，創意的思考是一切改變的起點，敢於想像，夢就有機會成真！您有滿腦子創意，卻找不到舞台施展嗎？您有滿腔熱血，卻苦無實踐理想的管道嗎？「臺北文創天空創意節」已邁向第三屆，將提供一個充滿養份、任人自由揮灑的園地，等待您用天馬行空的靈感灌溉，讓創意的種子開花結果。
本屆徵件主題：原。味「原。味」─隨本心而初釀的滋味，如果能回到原始的那種美好…..在生命的歷程中，我們總被過多的調味所迷惑，我們可還記得自己的原味？「2017臺北文創天空創意節」將以「原。味」為題誠摯邀請您透過視覺設計、展演、多媒體、影音、行動藝術等各類創作形式，期望在探尋初衷的道路上，看見每個創作者的感動故事。',

'臺北文創基金會',
100000, 
30000, 
'2017-04-20 17:40:00', 
'2017-06-26 23:59:00',
'2017-08-23 23:59:00',
'C:/Artfolio/BountyImgs/1.jpg',
'C:/Artfolio/BountyImgs/1.jpg',
1205);

insert into b_tag (b_id, b_tag) values(7,'創意')
insert into b_tag (b_id, b_tag) values(7,'台北')
insert into b_tag (b_id, b_tag) values(7,'文創')

INSERT INTO tb_bounty 
(mid, 
 b_state,
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
1, 
1,
'浪漫臺三線 玩印客 印花再造計畫 客家印花設計競賽比賽辦法',

'「浪漫臺三線」為國家新政策，全國唯一以服裝訂製為特色的【衣啟飛翔創客基地】，要用設計玩轉客家印象。
招集所有對設計有想法熱情的你，讓我們一同挖掘浪漫台三線上的客家文化特色，人文、風景、建築、產業等元素，融入印花設計，創造客家印花的新可能！
活動目標：「浪漫臺三線」為國家新政策，身為全國唯一以服裝訂製為特色的衣啟飛翔創客基地，要用設計玩轉客家印象。
招集所有對設計有想法熱情的你，讓我們一同挖掘浪漫台三線上的客家文化特色，用人文、風景、建築、產業等元素，融入印花設計，創造客家印花的新可能！計畫詳情可前往官網參考了解。
募集對象：只要對設計創作有熱情或興趣者皆可報名，請以個人形式報名，每人最多投稿三款。亦歡迎全台視傳系或視覺設計師報名參加。獎勵辦法：
優選作品，可獲得獎金新台幣20,000元整，獎狀乙紙，共2名。佳作作品，可獲得獎金新台幣5,000元整，獎狀乙紙，共4名。
活動時間：報名收件時間：即日起至7月10日止。設計評選時間：7月11日至7月17日。得獎公布時間：7月18日。', 

'報名辦法：下載簡章(含比賽辦法、報名表、著作財產權讓與同意書)檔案，並完整填寫。簽署相關同意書ˇ報名表後，將作品與參賽作品圖檔(含創作原檔與JPG檔)一同mail至makerspacefd@gmail.com。
信件主旨請註明【浪漫臺三線 印花再造計畫】*檔案過大可使用雲端連結作品繳交說明：交件方式：電子郵件收件。收件截止日期：106年7月10日24:00止
【以主辦單位收到電子郵件時間為主，逾時恕不受理】作品尺寸： 寬64*長54cm 四方連續印花。作品格式：請繳交原始設計圖檔(ai檔或psd檔)，以及解析度300dpi以上jpg檔。
參賽數量：每人最多提交3款作品。評選方向：設計35%、創意25%、文化20%、市場15%著作權規範參賽作品限未經刊登使用，且未曾參與其他國內外相關設計競賽之作品。
嚴禁抄襲、仿冒，違者經評定後將取消得獎資格與追回獎項，並自行負責相關法律責任。參賽作品的著作權若有第三者提出異議，主辦單位概不負責，相關費用將由參賽者全數負擔。參賽作品使用的元素、圖像，必須是參賽者本人原創作品，或者是得到所有權者事前授權使用的作品。如有使用他人圖像之參賽者，需事先主動告知，並需繳交原作者之使用授權同意書，繳交方式為在線上報名時附上授權檔案。
主辦單位對於所有參賽作品均擁有授與各傳播媒體報導刊載、作品使用修改、刊登廣告、編制成光碟、印製海報或出版專書、網路應用之相關權利，並不另支付稿費及版稅。
得獎作品著作版權歸主辦單位所有，主辦單位擁有授權廠商生產應用之權利。得獎者須同意無酬配合本案進行推廣宣傳。經由評審團隊篩選之優良作品，須無償授權相關活動巡迴展覽發表及後續之商業應用。參加者需詳閱活動辦法等相關規範，若作品與任一規定不符則不列入評選。
凡報名參加本活動者皆視為同意以上之各項規定，如遇比賽規範更動，請隨時上衣啟飛翔創客基地粉絲頁查詢，主辦單位將不另行通知。',

'勞動部勞動力發展署桃竹苗分署-衣啟飛翔創客基地',
800000, 
200000, 
'2017-04-19 14:00:00', 
'2017-05-31 12:00:00',
'2017-06-28 12:00:00',
'C:/Artfolio/BountyImgs/2.jpg',
'C:/Artfolio/BountyImgs/2.jpg',
3255);

insert into b_tag (b_id, b_tag) values(8,'創意')
insert into b_tag (b_id, b_tag) values(8,'設計')
insert into b_tag (b_id, b_tag) values(8,'文創')
insert into b_tag (b_id, b_tag) values(8,'產品設計')
insert into b_tag (b_id, b_tag) values(8,'文化')

INSERT INTO tb_bounty 
(mid, 
 b_state,
 b_title,
 b_content,
 b_partimethod,
 b_organizer,
 b_bonus_total,
 b_bonus_max,
 b_startdate,
 b_enddate,
 b_announced, 
 b_attach_pic,
 b_attach_pdf,
 b_click
 ) 
VALUES (
1, 
0,
'106年度 低壓智慧電表大數據分析與設計競賽', 

'行政院106年核定修正【智慧電網總體規劃方案】，將積極推動低壓智慧電表系統建置，預計在113年全台低壓將達300萬戶。
壹、競賽主旨行政院106年核定修正【智慧電網總體規劃方案】，將積極推動低壓智慧電表系統建置，預計在113年全台 低壓將達300萬戶。因應後續發展趨勢與政策推展，經濟部能源局將舉辦【低壓智慧電表大數據分析與設計 競賽】，透過開放智慧電表大數據資料，徵求各級學校提出論文分析或程式設計，促成我國智慧電表產業相 關人才之培育與養成。
貳、辦理單位指導單位：經濟部能源局主辦單位：財團法人工業技術研究院', 

'參、參賽資格
一、全國高中職、大專院校 (碩博士) 之在校學生，可跨領域或學校共同組團參賽，每校不限一隊參加。
二、每組參賽隊伍報名人數限2~10人。學生至少2位，教職員最多2位(可無)。
三、隊伍或學員可同時報名研析組和設計組，但在同一類組別中，學員最多參加一隊，惟指導老師不限。違 者取消學員參賽資格。
四、指導老師資格，限定為學校教職員。
五、競賽執行單位所屬人員與當屆評審委員均不得參加。

肆、競賽類組
研析組∶以撰寫論文報告為主，針對歷史用電資料，利用數值分析等方法，提出具學術或應用價值的研究。
設計組∶以製作軟體程式為主，針對線上用電資料，設計即時用電查詢等功能，提供民眾有感的操作介面。
伍、獎項、獎金與額度',

'106年度低壓智慧電表大數據分析與設計競賽活動小組',
200000, 
30000, 
'2017-05-15 10:58:00', 
'2017-08-16 17:00:00',
'2017-10-20 10:58:00',
'C:/Artfolio/BountyImgs/5.jpg',
'C:/Artfolio/BountyImgs/5.jpg',
32205);


insert into b_tag (b_id, b_tag) values(9,'創意')
insert into b_tag (b_id, b_tag) values(9,'文創')
insert into b_tag (b_id, b_tag) values(9,'設計')
insert into b_tag (b_id, b_tag) values(9,'大數據')


insert into tb_track (mid, b_id) values (4,4);
insert into tb_track (mid, b_id) values (4,2);

