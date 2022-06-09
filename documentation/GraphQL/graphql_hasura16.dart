/*
Subscriptions to show online users

GraphQL sorgularımız ve mutasyonlarımız arasında gezindik. 
Yapılacakları sorguladık, yeni bir yapılacaklar öğesi ekledik, 
mevcut bir yapılacakları güncelledik, mevcut bir yapılacaklar 
öğesini kaldırdık.

Şimdi heyecan verici kısma gelelim.

GraphQL Subscriptions

Çevrimiçi kullanıcıların listesini görüntüleyen bir kullanıcı arayüzü 
bölümümüz var. Şimdiye kadar verileri almak ve bunları kullanıcı arayüzünde 
görüntülemek için sorgular yaptık. Ancak genellikle çevrimiçi kullanıcıların 
verileri dinamiktir.

Bunu verimli bir şekilde halletmek için GraphQL sunucusundan gerçek zamanlı 
veri almak için GraphQL Abonelik API'sini kullanabiliriz.

Ama ama ama...

Sunucuya giriş yapan kullanıcının çevrimiçi olduğunu söylememiz gerekiyor. 
last_seen Kullanıcının zaman damgası değerini güncelleyen bir mutasyon yapmak 
için sunucumuzu yoklamamız gerekiyor .

Kendimizi çevrimiçi görmek için önce bu değişikliği yapmalıyız. Halihazırda 
oturum açtığımızı ve verilerinizi sunucuya kaydettiğimizi, ancak 
last_seen değerinizi güncellemediğimizi hatırlıyor musunuz?
*/