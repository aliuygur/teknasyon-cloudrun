# Google Cloud Run Nedir?

Cloud Run Nedir? sorusunu sormadan once bu sunumda sikca telefuz edecegimiz "serverless" ve "container" kavramlarini tanimlamak gerekiyor.

**Serverless Nedir?**

Serverles computing, bakimi ve yonetiminden sorumlu olmadigimiz, uygulamalarimizin calisabilmesi icin ihtiyac duydugu kaynaklarin hizmet olarak (SaaS) satin alinabildigi bir modeldir.

Ozetle ortada bir sunucu var ancak bizim sorumlulugumuzda degil, biz asil sorumlulugumuza odaklanarak daha az insan kaynagi ve gorece daha dusuk maliyetler ile uygulamalarimizi calistirabilmekteyiz.

Bazi serverless cozum ornekleri;

AWS Lambda, AWS Fargate, AWS DynamoDB, AWS S3, GCP Cloud Function, GCP Cloud Run, GCP Cloud Datastore

**Container Nedir?**

Serverless kavramini tanimladiktan sonra simdi sira container kavraminda;

1965 yılında, "mikroişlemciler içindeki transistör sayısı her yıl iki katına çıkacaktır" diyen Moore, daha sonraları 1975 yılında bu öngörüsünü güncellemiş ve her iki yılda bir iki katına çıkacak şekilde düzeltmiştir

Sözün ilk söylendiği 1965 yılından bu yana bu yasa çoğunlukla geçerli olmuştur. Gordon Moore, 13 Nisan 2005 tarihinde kendisi ile yapılan bir söyleşide, öngörüsünün kısa bir zaman içinde geçerliliğini yitirebileceğini ifade etmiştir.

https://tr.wikipedia.org/wiki/Moore_yasas%C4%B1

Son zamanlarda donanim anlaminda dikey buyume neredeyse durma noktasina geldi ancak yazilim anlaminda internetin bulunmasi ile birlikte ciddi gelismeler yasaniyor.

We Are Social ve Hootsuite tarafından hazırlanan 'Digital 2021' raporuna göre internet kullanıcılarının sayısı 4,88 milyarı buldu. Bu rakam, dünya nüfusunun yüzde 61,8'ine denk geliyor. 

Bu talebi karsilayabilmek adina yazilimlar multi-core bilgisayarlarda daha sonra da bilgisayar tarlalarinda (cluster) calismaya basladi. 

Bir uygulama birden fazla bilgisayar uzerinde kosacak, yuk ya da problem aninda mevcut yeni makineler acilacak saniyeler icerisinde uygulama mevcut makinalar uzerine kaydirilacak, eski makineler kapatilacak vs gibi cozulmesi gereken yeni problemler ortaya cikti.

Artik soyutlama cok onemliydi, uygulama ile uzerinde kostugu ortam iyi bir sekilde soyutlanirsa, uygulamalari ve uzerinde kostugu ortamlari yapilandirmak cok daha hizli ve kolay olacakti ve karsinizda Docker!

Konteyer kavrami Docker'dan once de vardi ancak bunu herkesin kullanabilecegi bir basitlige indirip urun haline getiren Docker'dir.

Konteyner'lar sayesinde uygulamanizin ayarlarini ve bagimliliklarini Dockerfile yaridimi ile belirleyip paketliyorsunuz, artik docker calistirabilen herhangi bir ortamda uygulamanizin calisacagi garanti ediliyor.


"serverless" ve "container" kavramlarini anladiktan sonra simdi GCP Cloud Run konusabiliriz.

GCP Cloud Run, Docker ile paketlediginiz container'larinizi sunucu bakimi ya da olcekleme gibi dertleriniz olmadan calistirabilmenize imkan taniyor. Yani Cloud Run container'lar icin serverless hizmeti sunuyor.

GCP Cloud Run sizi Kubernetes, Docker Swarm gibi container orkestratorlerin karmasikligindan soyutluyor, 1 saatlik bu sunumla bile uygulamalarinizi Cloud Run uzerinde calistirmaya baslayabileceksiniz. Tabi biraz Docker bildiginizi varsayiyorum.

Simdi sozu fazla uzatmadan ornekler ile Cloud Run ozelliklerini denemeye baslayalim.


- Ornek uygulamayi en basit haliyle yayina alalim.
- Cloud Run'in mevcut servis icin olusturdugu HTTPs destekli URL'den uygulamamiza bakalim.
- Uygulamanin Metric ve Loglarina bakalim.
- CloudBuild ile basit bir CI/CD pipeline hazirlayip, Go ile yazdigimiz kendi uygulamami yayina alalim.
- Trafic Spliting sayesinde trafigi versiyonlar arasinda dagitalim.
- Revision URL(tags) sayesinde her versiyona ozel bir url uretelim.
- CPU Allocation and pricing seceneklerine bakalim.
- Capacity ayarlari ile CPU, RAM, Request Timeout ve Concurrency ayarlarina bakalim.
- Autoscaling ve Min instance ozelligi sayesinde Coldstart problemini asalim.
- Environment ve Secret ile ortam degiskenlerini ayarlayalim.
- Uygulamamiza custom bir domain ekleyelim.
- Uygulamamizi LoadBalancer arkasinda calistiralim.
- Uygulamamizin bazi enpointleri icin Cloud CDN Cache'i aktif edelim.


uygulamada 


- ortam degiskenlerini basacak bir endpoint
- 10 saniyeden uzun surecek bir endpoint (cache control ile daha sonra cachelecek)
- ping/pong endpoint

