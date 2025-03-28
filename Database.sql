-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: user
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES (1,'admin','123123',NULL,NULL),(2,'Employer','As123?','Employer','0eda9248e3fb13043720448aca339fdf'),(3,'Employer1','As123?','Employer','1cc9e317fa663beffae9abc1d6df572d'),(4,'Employee','As123?','Employee','5f8e87d399f312ed27eb5dc1724f7a9d'),(5,'Employer3','As123?','Employer',NULL),(6,'Employer4','As123?','Employer',NULL);
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `jobid` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `create_time` int NOT NULL,
  `update_time` int NOT NULL,
  `profileid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_apply_idx` (`userid`),
  KEY `fk_apply_new_idx` (`jobid`),
  KEY `fk_apply_profile_idx` (`profileid`),
  CONSTRAINT `fk_apply` FOREIGN KEY (`userid`) REFERENCES `applicant` (`id`),
  CONSTRAINT `fk_apply_new` FOREIGN KEY (`jobid`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_apply_profile` FOREIGN KEY (`profileid`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `applicant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'JobSeeker','New Zealand','Amy','0274389456','Amy@gmail.com',2),(2,NULL,NULL,NULL,NULL,NULL,3),(3,NULL,NULL,NULL,NULL,NULL,5),(4,NULL,NULL,NULL,NULL,NULL,6);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jobName` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `jobtype` varchar(30) DEFAULT NULL,
  `paytype` varchar(30) DEFAULT NULL,
  `maxmoney` double DEFAULT NULL,
  `minmoney` double DEFAULT NULL,
  `description` longtext,
  `summary` longtext,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_job_idx` (`userid`),
  CONSTRAINT `fk_job` FOREIGN KEY (`userid`) REFERENCES `applicant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Scientist','Auckland','Science & Technology','Full time','Annual salary',120000,80000,'Routinely carrying out small and medium scale RNA synthesis, assessing and accurately reporting the quality of each batch.Perform maintenance and quality control procedures on for molecular biology instruments including those involved in mRNA production, quantification and purification as required.Organise and maintain the RNA workspace including weekly cleaning duties, tracking reagents and ordering supplies.Support the design, engineering and production of DNA plasmid constructs suitable for downstream mRNA production.Maintain accurate records, quality control documents, write SOPs and report scientific data in oral and written form when required.Be an active member of the Hugh Green Cytometry Centre, contributing to scientific publications for the HGCC and providing support and cover to team members as required.At supervisor’s discretion, work on various projects to extend the services HGCC can offer to both internal and external clients.\n','Opportunities to support and engage in life-saving projects.A supportive team culture.Exposure to a unique research environment working with highly driven scientists and support staff.Training and development opportunities to support you in your career with us, with potential for career progression.Opportunities for overseas travel and conference attendance.Employee Assistance Programme – confidential, professional services which can support and guide you through your life or work challenges.An excellent location, with great offices at Victoria University in Kelburn offering a great supply of cafes and other amenities.',2),(2,'Account Manager','Auckland','Sales','Full time','Annual salary',110000,90000,'Proactively manage and develop existing and new customer relationships.Explore expanding customers product portfolios, introducing new categories, aiming to increase spend and share of wallet.Provide proactive support to resellers, with training, product information and new product presentations.Perform joint customer visits with the Reseller sales team and assist with their sales activities.Build strong customer relationships, across the business, including factory and quality/ food safety teams.Perform workplace surveys, providing recommendations around workplace hygiene.Promote new products, bundle product suites, and ensure a value-added service.Plan and manage a sales pipeline across all customers.Acquisition of targeted new business, through business development activities Work collaboratively with Australian sales team, across mutual cross Tasman clientsIncrease sales through effective, knowledgeable, and innovative selling. Regional travel through to BOP and the occasional trip to Auckland. (2-3 nights away a month) Ensure regular visits to customer sites, to keep abreast of any specific needs.','A base salary of between $90K - $110K, plus an incentive bonus for achieving targets.A full use company vehicle and tools of trade.Manage your day / week / schedule, working from a home office.',3),(3,'Accountant','Auckland','Accounting','Full time','Annual salary',106581,75495,'Transactional accounting.Processing accounts payable and receivable.Bank and balance sheet reconciliationsPreparation of monthly reports and forecasting.Payroll services.Preparation of PAYE & GST returns.General administration tasks as required','Flexible work arrangements – work in a way that suits you, us and our clients best.Subsidised professional qualifications and paid professional memberships.Social events, social exercise classes, and weekly firm drinks.A passionate and sociable teamA focus on wellness and well-being.Plus much more',5),(4,'Accountant','Auckland','Accounting','Full time','Annual salary',106581,75495,'Designing, improving, and implementing processes to enhance efficiency and accuracy of information produced by the business.Analysis and review of Property expenditure to budget/forecasts– including capex vs maintenance accounting treatments.Compiling.Financial statements for New Zealand Group and its entities that require financial statements to be lodged.Providing financial and business analysis for the New Zealand Group.Contributing to reporting, monthly, half year and full year for the New Zealand Group','Free access to Marram health care benefits and discounted holiday homes .All the tools of trade you need to do your job.Discounts for Samsung, Repco, PB Tech, Gym memberships and more!.$500 bonus for current employees who refer a friend to Downer.Progression and development programs on offer including our inspiring leader’s programme for top performers',6),(5,'Teaching Laboratory Technician','Auckland','Science & Technology','Part time','Annual salary',63651,59285,'As time permits, to provide technical support/assistance to researchers/research labs, Compliance Manager and Department Health and Safety Officer.To ensure the smooth operation of all undergraduate practical sessions in the laboratory.To undertake tasks as requested by the Lead Teaching Laboratory Technician.Together with the Lead Teaching Laboratory Technician, management and organisation of all undergraduate and professional programme practical sessions run by the Department of Pathology.','Our team of technical staff work closely with staff and students to provide technical support for the department’s teaching and research.',2),(6,'Bookkeeper','Auckland','Accounting','Contract','Hourly rate',37,30,'Maintain accurate and up-to-date financial records.Reconcile accounts and prepare financial statements.Assist with budgeting and forecasting.Manage accounts payable and accounts receivable.Work closely with the finance team to ensure compliance with financial regulations.','Flexible part-time schedule to fit your needs.Competitive compensation.Opportunities for professional growth and development.A supportive and collaborative work environment.',3),(7,'Bookkeeper','Auckland','Accounting','Contract','Hourly rate',37,30,'We have many clients with bookkeeping needs varying from 1 hr/wk up to 20 so there is a lot of variety in this position.  For the vast majority of our clients the work is remote and you can work from home remotely and to your own time frame, just as long as the work gets done. The roles consist of standard bookkeeping tasks such as AP, AR, bank reconciliations and month end accounting tasks, preparing GST and payroll. The training we provide is very specific and is designed to help you move to a more senior bookkeeping level where further opportunities exist within the business.','Ideally we are looking for a bookkeeping contractor with some experience but who is looking to move up to the next level.  We will provide you with support, training and a mentor to allow you to do that.  Experience with accounting packages such as MYOB and  Xero would also be expected.  You will also need to have excellent communication and the ability to interact with a wide variety of people as you will be given plenty of responsibility to deal directly with the client.  Being a member of the NZ Bookkeepers Association would be an advantage and we do want someone who is keen to continue learning given the fast changing bookkeeping environment.  There will be a preference towards someone with professional bookkeeping qualifications and even if you have only a little experience we may well still be interest in talking to you. Typically, most our our bookkeepers work about 25-35hrs/wk and this role would not suit someone wanting full time employment.  This an excellent opportunity for an enthusiastic bookkeeper with strong initiative  to further develop their career as we provide regular training and a large team of other highly experienced bookkeepers.',5),(8,'Territory Sales Representative','Auckland','Sales','Full time','Annual salary',80000,75000,'Maintain and develop relationships with customers within the territory.Maintain regular call cycle for the key existing customer base whilst also cold calling to seek new business opportunities.Introduce new product line by presenting to the business owners.Scheduling and attending regular in-store training programs with business owners.Tracking sales performance and accurately forecasting annually, quarterly and monthly revenue streams.Attending weekly and monthly sales meetings\n','Base Salary of $75,000-$80,000 + bonus system.Be part of a organization where you can grow your career.Full Training provided.Supportive management and great culture to be part of',6),(9,'Scientist','Hamilton','Science & Technology','Full time','Annual salary',120000,80000,'Lead the scientific research in the development and testing of BioLumic seed treatments.Provide agronomic expertise to the Science team.Communicate experimental findings to other team members.Work with feedback and input from team members; providing feedback and advice in return.Conceive, design, execute and analyse R&D trials.Strong organisational (time management), analytical and creative problem-solving skills.Proven ability to design and run statistically robust scientific trials.Maintain accurate records,quality control documents, write SOPs and report scientific data in oral and written form when required.Be an active member of the Hugh Green Cytometry Centre, contributing to scientific publications for the HGCC and providing support and cover to team members as required.At supervisor’s discretion, work on various projects to extend the services HGCC can offer to both internal and external clients.','BioLumic is a plant biotechnology company that programs plants with light. We develop and apply UV photomorphogenic light recipes to seeds and seedlings, to trigger biological mechanisms that increase plant growth, health, and yields. Our science is at the cutting edge of multiple disciplines and evolving rapidly as we continue to expand our operations both in New Zealand and the US. We are a successful company entering commercial expansion, and we are looking for great people to come on board as we enter our next exciting phase of growth. ',2),(10,'Bookkeeper','Hamilton','Accounting','Contract','Hourly rate',37,30,'Assist Showroom Managers reconciling daily banking deposits and POS reconciliations.Prepare weekly bank reconciliations.Month-end processing, including general ledger maintenance, reconciliations & accruals.Preparation of inter-company transactions, journals, and reconciliationsManage the credit card reimbursement and reconciliation process.Review and produce new processes and procedures to optimise the administration of the business.','In Residence Ltd is a market leader in the specification and supply of premium quality hardware, tapware and fittings for kitchens and bathrooms. Our Australian trading arm is The English Tapware Company Ltd.  From our origin in 1995, we have become an established presence in the NZ and Australian markets. Continued growth has created a position for an experienced Accountant or Bookkeeper based from our Greenlane showroom.  The successful applicant will manage the financial recording and reporting for our NZ and Australian businesses. They will liaise with our external Accountants in each country and ADP Payroll in Australia. Both businesses operate using the same Microsoft NAV ERP. This role forms part of the management team and reports to the Managing Director.  ',3),(11,'Bookkeeper','Hamilton','Accounting','Contract','Hourly rate',37,30,'Management of the Accounts Payable process.Following up on overdue debtor payments.Carrying out credit checks.Weekly payroll preparation.GST return preparation.Filing and document management.General office duties as required','In return for your skills and experience, you’ll enjoy a great team environment, a competitive salary with benefits, free parking, an active social club and much more!  If you’re looking for a long-term role where you can develop your skills further and look forward to coming to work, please select “apply now”.',5),(12,'Account Manager','Hamilton','Sales','Full time','Annual salary',110000,90000,'Identify and win new business opportunities.Deliver on sales activities such as prospecting, introduction meetings, client qualification and presentations.Manage your sales pipeline, with regular contact to nurture prospects, into new customers.Partner with customers to understand their business and their requirements and ensure your service is better than any competitor.  Identify customer growth opportunities and pitch solutions to meet these.Offer customised solutions to suit the specific needs of each customer.Perform regular customer surveys, ensuring customers are getting the most effective and efficient solutions.Forecast and plan around any specific client projects.\nPlan and manage time, to balance both new business and account management activities.\nThis is a client facing role. You will be out talking to new and existing customers. No desk jockeys please!\n\nBuild strong customer relationships, across the business, including factory and quality/ food safety teams.\nPerform workplace surveys, providing recommendations around workplace hygiene.\nPromote new products, bundle product suites, and ensure a value-added service.\nPlan and manage a sales pipeline across all customers.\nAcquisition of targeted new business, through business development activities \nWork collaboratively with Australian sales team, across mutual cross Tasman clients\nIncrease sales through effective, knowledgeable, and innovative selling. \nRegional travel through to BOP and the occasional trip to Auckland. (2-3 nights away a month) \nEnsure regular visits to customer sites, to keep abreast of any specific needs.','Base $90K + Com + Car. OTE First Year $120K - $150K + uncapped.Commissions on all reoccurring customers spend..2nd year earnings will grow, as will 3rd and 4th year earnings..With a completely uncapped commission structure – you certainly can earn incredibly well, if you work hard and are good at your role..Loads of training and upskilling opportunities.An environment that treats you like an adult. No Micromanagement.Work from home flexibility, which means you can work anywhere in the BOP, but  close to Tauranga will be best.',6),(13,'Accountant','Hamilton','Accounting','Full time','Annual salary',106581,75495,'Prepare monthly management reporting.Assist in budgeting, reforecasts, and variance reporting.Assist with the preparation of Statutory Financial reporting and liaising with external auditors during the year-end audit.Prepare cash reports and forecasts.Preparation of GST and FBT returns.Analyse product margins and report findings.Manage intercompany transactions and reconciliations.Build positive relationships with internal and external stakeholders.Review and recommend improvements to processes and control procedures.Support the Accounts Payable and Accounts Receivable functions.','A fun and collaborative work environment.Opportunities for growth and development.Based in Eden Terrace, with some work-from-home flexibility.Competitive salary and benefits package, including staff travel benefits and EAP.Commitment to diversity, equity, and inclusion.2 days per calendar year to volunteer for organisations around Aotearoa New Zealand ',2),(14,'Territory Sales Representative','Hamilton','Sales','Full time','Annual salary',80000,75000,'From the makers of ‘V\' Energy and Suntory BOSS Coffee comes an opportunity not to be missed!Territory Managers are the powerhouse of any FMCG business, you will have a solid understanding of who we are as a business, our products and just as importantly - what our customers need from us and how we help grow their business (and ours).In this role, you will be supported by our Area Sales Manager and be a valued member of our Upper North Island sales team covering the Mount Manganui, Papamoa and Whakatane area.\n\nYou\'ll be focused on increasing our footprint and SKU count to grow your customers and territory. Our ideal candidate will be ambitious, resilient and enjoy working in a fun and collaborative team environment.','If you\'re not an expert in all of these areas, don\'t worry! Here at Frucor Suntory, we don\'t take ourselves too seriously and like to have fun, but we don\'t shy away from a challenge, and neither should you. A lot of what we look for is how you would align with our values and your ability to utilise your unique skills and experience (superpowers) to make a difference so if you\'re interested in growing your career in this space, we\'d love to hear from you.',3),(15,'Business Development Manager','Hamilton','Sales','Full time','Annual salary',90000,75000,'This is a new position that will be responsible for driving and delivering regional and national supply agreements into the commercial sectors for the benefit of the Bowranda sales and installation network. Focusing on Retirement villages, hospitality, Education sector, corporate and retail. The role can be based in Auckland or Christchurch however national travel will be required. ','This is a senior position within the company and a salary and car will be provided commensurate with the role and experience.',5),(16,'Sales Executive','Hamilton','Sales','Part time','Hourly rate',40,40,'Sales Leadership and Business Development: Spearheading our sales initiatives.Customer Account Management: Nurturing and sustaining invaluable relationships.Technical Solutions Architecture: Crafting ingenious solutions.Marketing Support: Amplifying our presence in the market.Yes, travel. You’ll be leveraging your networks in New Zealand, and potentially Australia. ','Joining this company promises an enriching journey. They foster an enjoyable work environment and offer competitive compensation, including stock options. Flexibility is embedded in their culture, promoting a supportive professional community passionate about knowledge-sharing and personal growth.A company at the intersection of innovation, leveraging cutting-edge technologies in an ever-evolving and critical realm of cybersecurity.',6),(17,'QC Systems Senior Specialist','Wellington','Science & Technology','Full time','Annual salary',120000,85000,'Proposing, sourcing, & implementing new equipment.Managing change controls for the quality group.Leading software improvements and implementation.Functioning as the Data Integrity Lead for the site.Information Technology (IT) systems assessment.Contributing to the improvement of technical and operational systems & processes.Ensuring calibration maintenance programs are maintained.Monitoring and maintaining the validated state of test methods and equipment.Performing internal & external subcontracting laboratory audits.Generating formal reports as required.Benchmark & remain current with developing new technologies in the vaccine and biopharmaceutical processing field.Troubleshooting and problem solving','With an extensive background working in accredited laboratories (ISO17025), this role will provide technical leadership for the Quality Control Laboratory Systems at our client\'s state-of-the-art testing facilities situated near Upper Hutt, Wellington.Reporting to the Site Quality Head, your expertise will contribute to supporting the development, continuous improvement, and implementation of equipment, processes, test methods, and procedures. This role will also ensure QC testing is performed in accordance with global quality policies & standards.',2),(18,'Laboratory & Sampling Analyst','Wellington','Science & Technology','Full time','Annual salary',120000,85000,'Sub Sampling of Raw Materials and finished products.In Process laboratory analysis, reporting and training of practise.Confirmation of specifications and release of in process items.Reporting of inconsistencies and positive management of problems.','Synlait is a dynamic, purpose-led milk nutrition company that is Doing Milk Differently for a Healthier World! We pride our organisation as being different and allowing our spirit to drive our success. shifting perceptions and driving value through new thinking and a new attitude. You’ll be joining down-to-earth, authentic people working together to create the very best in milk nutrition as we combine expert farming with innovative thinking and  state-of-the-art processing to produce a range of nutritional milk products for our global customers. \n\nWe will challenge you providing the opportunities you’ve been seeking to expand your career; we believe that everyone brings unique experiences and perspectives to the table so are committed to creating an inclusive workplace and embrace diversity to drive innovation and business success. \n\nTogether we create a workplace where everyone can thrive and contribute their best ',3),(19,'Accountant','Wellington','Accounting','Full time','Annual salary',106581,75495,'Preparation of monthly accounts including journal entries and accruals, provide oversite and control over all subledgers including consolidated accounts for the NZHL Group.Statutory compliance - Review PAYE, FBT and GST .Preparation and reconciliation of monthly income tax calculation for Group companies .Review and complete balance sheet reconciliations; review, reconcile and authorise journal entries and supplier payments as well as review and oversee of commission, franchise bonus and trail payment processes..Franchise loan advance administration management, consolidated month end reporting as well as assisting with annual budgeting and rolling forecasting .Support the accounts team with assistance of raising PO\'s when needed and much more!','Our great range of benefits for permanent employees include banking benefits and insurance discounts, our NZHL values based, collaborative, inclusive and socially vibrant culture where everyone is friendly and happy to help with support of ongoing professional development, health and wellbeing offerings such as our Employee Assistance Programme available as well. ',5),(20,'Accountant','Wellington','Accounting','Full time','Annual salary',106581,75495,'Daily bank reconciliations and cash management.Manage accounts payable.Payroll processing for all our entities.Accounts receivable including daily reporting, invoicing, receipting and following up on overdue invoices.Keeping the cash-flow up to date.Preparation of IRD returns and payments, including GST and PAYE.Assisting in month-end accounting and reporting and P&L analysis including processing of costs and accruals for month end.Post and process journal entries to ensure all business transactions and intercompany records are correct.Management of key accounting systems and processes e.g. Xero, Lightyear, Klipfolio, IMS payroll, Ideal POS and Cooking the Books.Adhoc projects and process improvements','Permanent Full time role, Monday-Friday.Close-knit, supportive and fun collaborative team.Training and development with progression.Discounted Food Tab',6),(21,'Territory Sales Representative','Wellington','Sales','Full time','Annual salary',80000,75000,'Achieving Budgets.Identification of new business opportunities.Store reviews.Drive sales excellence in the field.Proactive approach to sales with strong desire and ability to win and grow new business while maintaining a loyal customer base.','Health insurance (Extends to dependants under 16).Life insurance.Company vehicle.Career development.Competitive remuneration.Staff sales',2),(22,'Business Development Manager','Wellington','Sales','Full time','Annual salary',90000,75000,'Strategic Sales Planning:  Develop and implement business development strategies, processes, and plans that align with the company\'s overall business objectives. Set targets, track progress, and adjust strategies as required.Lead Generation: Acquisition of new clients through market research, cold calling, networking, attending industry events, and utilising digital marketing strategies.Relationship Building:  Build and maintain excellent working relationships with new and existing clients across the commercial and residential construction markets.Negotiation: In collaboration with other senior leaders in the business you will be heavily involved in client negotiations, which would include contracts, pricing and other terms and conditions.','Based in Palmerston North or Wellington, this newly created Business Development role will report to the Managing Director. The Business Development Manager will play a pivotal role in the company\'s growth by identifying and capitalising on new opportunities,fostering relationships, and contributing to revenue generation and business expansion. The position will drive all sales and business development activities across the lower and central North Island regions, ensuring that these align to wider strategic objectives. ',3),(23,'Business Development Manager','Wellington','Sales','Full time','Annual salary',90000,75000,'Proactively meeting or exceeding monthly sales targets.Develop and present proposals for new clients and reports for existing clients.Create ideas for lead generation and work with closely with marketing to design strategies that promote the company\'s brand awareness.Perform and review pricing and services with related industry competitors.Build and maintain solid relationships with new and existing clients.Meet regularly with the sales team and key stakeholders ensuring there is continuous improvement.','This is a busy and highly visible role that requires strong relationship management and organizational skills. Working across New Zealand, you\'ll be responsible for managing new and existing clients as well as identifying new market opportunities. You will be motivated by sales results and an unwavering commitment to client satisfaction!',5),(24,'Sales Executive','Wellington','Sales','Part time','Hourly rate',40,40,'To ensure the achievement of your territory sales out budgets.To actively build & manage positive business relationships with all Bunnings store key decision makers in your territory.Provide effective actioning upon all business development & sales opportunities.Understand & effectively manage the Bunnings Key Performance Indicators on a store by store basis, within your designated territory.Continuously monitor market trends, competitor activity & the overall performance of the Bunnings stores within your territory, so that adjustments can be made during the year, allowing you to achieve your sales out budget.Make sure you comply with all TTI OH&S and Company procedures, as well as working within the Bunnings Company OH&S guidelines.Ensure your activities comply with all relevant acts, legal demands & ethical standards.\n','Discounts & Perks: Fully maintained company car, laptop and phone allowance. Generous discounts on company products.Lifestyle: Hybrid working model to support flexibility. Opportunity to work a Monday to Friday or Tuesday to Saturday rosterPersonal Development: Access to professional development programs.Health & Wellbeing: Paid Parental Leave and Employee Assistance Program.Social: Recognition programs and social events to celebrate our team\'s achievements.',6),(25,'Accountant','Christchurch','Accounting','Full time','Annual salary',106581,75495,'The Management Accountant helps to support the Senior Management Accountants and Finance Director to provide strategic financial information covering operating and capital expenditure.','It’s an exciting time to work at MSD, with a newly structured finance leadership team and our transformation journey to strengthen systems and our ways of working ',2),(26,'Scientist','Christchurch','Science & Technology','Full time','Annual salary',120000,80000,'Evaluation and onboarding of new waste streams,Setup, sampling, monitoring and processing for trials ranging from waste processing to environmental effects and vermicast application,Support annual reporting and consent applications with scientific data,Develop monitoring systems and collect data in conjunction with the on-site team,Evaluate data and provide reporting to inform decision making for the wider team.','Not only is MyNoke a vibrant growing company full of passionate people we also have a friendly and energetic workplace where our team is regarded as our largest asset. ‘The MyNoke Way’ is our way of ensuring that team members are well rewarded. This includes an extra month’s pay in December. The successful applicant will work 40 hours per week based from our Taupō head office. There will be some travel involved, as well as some flexibility depending on the right applicant’s situation.',3),(27,'Teaching Laboratory Technician','Christchurch','Science & Technology','Part time','Annual salary',63651,59285,'Coordinate and prepare all undergraduate and professional programme practical classes run by the Department of Pathology.Oversee purchasing and resourcing for all laboratories, including maintaining inventories and equipment, and designing lab set-up.\nSupervise teaching laboratory technical staff.As time permits, to provide technical support to Researchers, Compliance Manager and Department Health and Safety Officer.Take responsibility for day-to-day duties of technical staff including planning and management of work demands through appropriate allocation of tasks.Take responsibility for monitoring, ordering and maintaining stocks of reagents, biologicals, consumables and chemicals required for undergraduate laboratories.','The Department houses several internationally recognised research groups and has six major research areas including; Cancer Biology, Clinical Pathology, Development, Genetics and Epigenetics, Haematology and Immunotherapy.',5),(28,'Teaching Laboratory Technician','Christchurch','Science & Technology','Part time','Annual salary',63651,59285,'As time permits, to provide technical support/assistance to researchers/research labs, Compliance Manager and Department Health and Safety Officer.To ensure the smooth operation of all undergraduate practical sessions in the laboratory.To undertake tasks as requested by the Lead Teaching Laboratory Technician.Together with the Lead Teaching Laboratory Technician, management and organisation of all undergraduate and professional programme practical sessions run by the Department of Pathology.','Our team of technical staff work closely with staff and students to provide technical support for the department’s teaching and research.',6),(29,'Bookkeeper','Christchurch','Accounting','Contract','Hourly rate',37,30,'Experience working with Xero.Understanding of accounting principles..Accurate and detail-orientated..Good communication skills, both verbal & written..A warm and professional telephone manner..At least two years experience in a similar role. .Experience with Payroll, PAYE, and GST.','Competitive hourly rate based on experience..Flexible working arrangement.',2),(30,'Account Manager','Christchurch','Sales','Full time','Annual salary',110000,90000,'Create a feasible business plan for your territory.Launch new products to customers in conjunction with supplier representatives.Spend time with their inherited portfolio of warm accounts to manage and grow.Ensure to keep an active call cycle to support high levels of customer satisfaction..Communicate with internal departments to create best outcomes for our customers.Ensure effective budgetary control over sales expenses, returns and promotional expenses against sales target.Work closely with our Procurement and Warehouse Operations to ensure accurate product forecasting to meet sales trends, customer and supplier needs.','We are one of New Zealand\'s largest privately family owned and operated food service distribution businesses. Every day more than 800 Service Foods people around 17 branches in New Zealand work hard to enhance our customer’s business by providing high level customer service, by being able to provide a superior range of products through innovation and supply chain.Our success as an organization is a direct result of our employees’ dedication and commitment to creating an environment they are proud to work in. We live our values of creativity, resilience, inclusivity, collaboration, work ethic and humility.',3),(31,'Account Manager','Christchurch','Sales','Full time','Annual salary',110000,90000,'Managing existing accounts.Establishing new business.The first point of contact for your customers.Nurturing, developing and growing business.Ensuring all customers needs are met - quoting on new business.Keeping up with industry developments and changes.Planning and developing strategies based on customer needs','We are a well-established, 100% NZ owned company located in multiple locations over NZ and Australia.  We are operating in a growing market place, and we are seeking an outstanding freight talent who is smart, positive, enthusiastic and driven. The role requires a high level of self-motivation, discipline and organisation. We are seeking a positive, energetic, result focused professional, who enjoys dealing with a diverse range of tasks on a daily basis. ',5),(32,'Territory Sales Representative','Christchurch','Sales','Full time','Annual salary',80000,75000,'As our newest Sales Representative based in Christchurch, you will proactively seek new business opportunities while developing and maintaining existing business relationships across the Canterbury region.You will achieve sales targets through effective planning and relationship management and applying sound product knowledge to meet our customers\' needs. Whilst maintaining an effective call plan, you will ensure your time is managed effectively to achieve planned and agreed call cycles, presenting relevant and appropriate offerings to our customers.','We have great opportunities for the right individuals to grow and develop their career. In return, we offer a very competitive salary, a company car and development opportunities.',6),(33,'Scientist','Wellington','Science & Technology','Full-time','Annual salary',1000,2000,'We are looking for an exceptional person who can contribute to a dynamic clinical affairs portfolio within anaesthesia team. This role has a global reach and involves all aspects of clinical affairs relating to a range of medical devices. Key responsibilities will include:\n\nClinical input into product development\nSupporting pre-market clinical investigations\nClinical evaluation and synthesis of clinical data to support regulatory submissions\nRisk management and post-market activities','Scientist',2);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `ifLook` int DEFAULT NULL,
  `message_content` longtext,
  `send_time` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk1_messsend_idx` (`sender_id`),
  KEY `fk1_messrec_idx` (`receiver_id`),
  CONSTRAINT `fk_messrec` FOREIGN KEY (`receiver_id`) REFERENCES `applicant` (`id`),
  CONSTRAINT `fk_messsend` FOREIGN KEY (`sender_id`) REFERENCES `applicant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,4,1,0,'Hello, I\'d like to apply for a job as a scientist.',1698569075),(2,1,4,0,'Hello, please tell me something about yourself.',1698570008);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perference`
--

DROP TABLE IF EXISTS `perference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `context` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_perference_idx` (`userid`),
  CONSTRAINT `fk_perference` FOREIGN KEY (`userid`) REFERENCES `applicant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perference`
--

LOCK TABLES `perference` WRITE;
/*!40000 ALTER TABLE `perference` DISABLE KEYS */;
/*!40000 ALTER TABLE `perference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `pdfLink` longtext,
  `pdfname` longtext,
  `create_time` int NOT NULL,
  `update_time` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_profile_idx` (`userid`),
  CONSTRAINT `fk_profile` FOREIGN KEY (`userid`) REFERENCES `applicant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `school` varchar(30) DEFAULT NULL,
  `academic` longtext,
  `major` varchar(20) DEFAULT NULL,
  `dateEduSta` date DEFAULT NULL,
  `dateEduEnd` date DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `dateWorSta` date DEFAULT NULL,
  `dateWorEnd` date DEFAULT NULL,
  `evaluation` longtext,
  `experience` longtext,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk1_idx` (`userid`),
  CONSTRAINT `fk_new` FOREIGN KEY (`userid`) REFERENCES `applicant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES (1,'Zhaoyu Wu','wuzhaoyu@163.com','0274378159','Massey University','Bachelor','Computer Science','2020-09-01','2024-07-10','JobSeeker','Developer','2020-02-10','2020-02-20','Responsible for the construction of the mall platform and project plan review, complete the code writing, server environment construction, etc.; Later completed version iteration and problem location; Ensure the normal operation of the mall with a daily life of 100,000 +.','I am cheerful, stable, energetic, warm and sincere. Have a strong professional ethics, professional basic knowledge solid. Work seriously and responsibly, take the initiative to take responsibility, actively establish a good working relationship with the surrounding working environment, and have a certain ability to coordinate resources. Cooperate with colleagues and other departments, have strong organizational skills, practical skills and team spirit. Can quickly adapt to various environments, and integrate into them.',4);
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 18:21:28
