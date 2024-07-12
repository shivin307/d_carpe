'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "98359018811d0a5f2db2b1ab461d1e6c",
"assets/AssetManifest.bin.json": "3d4c9b407dcb63a49e992b4fb97adcd4",
"assets/AssetManifest.json": "9c02cc62d9bddfbc14607e284137410c",
"assets/assets/icon/arrow_right_circle.svg": "77b20e2762b9f5b61e7748d6e4053509",
"assets/assets/icon/facebook.svg": "0266bfcda766cbf4993bae23fda8447e",
"assets/assets/icon/Frame%2520(1).svg": "5c7b59b4f7cbbb0a944877ad9e32dacb",
"assets/assets/icon/Frame.svg": "3dfb2683abbd4d80b3e5ec99fbbcd9b8",
"assets/assets/icon/instagram.svg": "ee28adf95d27657feffdd8cf2f2908a8",
"assets/assets/icon/linkedin-square.svg": "1dd9e25602641fc00e3e9064b33d8b2b",
"assets/assets/icon/LinkedIn.svg": "6fc0d6f0a64d2408cefe34230769b826",
"assets/assets/icon/Shield%2520Done.svg": "57f9d5a078f8598878cf2cb4b7e6a52b",
"assets/assets/icon/twitter.svg": "93e618c1b216026066e0e2f631913688",
"assets/assets/icon/youtube.svg": "74746b11bebc84997a041b247658787f",
"assets/assets/image/Blood%2520donation-pana.svg": "bef486107c814f5c52c8d72897f963d0",
"assets/assets/image/Doctors-rafiki.svg": "fb2d9cc970f0d5798b2ac2ca281dfbec",
"assets/assets/image/Ellipse%25201087.svg": "262df71db1ea5dea5de43353e1a0e820",
"assets/assets/image/Ellipse%25201088.svg": "8920d402ad86d6c3b42dec0a2755e025",
"assets/assets/image/Frame%25203868.svg": "27f41e8c5d98d737428bf04c78afaa72",
"assets/assets/image/gjnjknbrkjnb.png": "fb02f0bd85157bed466125655f65a02a",
"assets/assets/image/Group%2520(2).svg": "fc23551380268c399e1ba54d1a012976",
"assets/assets/image/Group%2520(3).svg": "10aca3449d128c2d5cb5a95a65b978f5",
"assets/assets/image/Group%25201000001098.png": "888040683524cb22355252355fe202ce",
"assets/assets/image/homedocimage.svg": "bd38ee5d3a98634f979303c5a9e2ab19",
"assets/assets/image/image%25206.png": "88e4367929ef0f6cb6579f6cc2338b1b",
"assets/assets/image/image1.png": "d08a2e2ace61e440a7e37788f9464a68",
"assets/assets/image/implant%25201.svg": "56ae2be413ea11d947dafebb1b40012d",
"assets/assets/image/Mask%2520group%2520(1).png": "8b3a8ed859899649f83e177d4e4be1df",
"assets/assets/image/Mask%2520group%2520(2).png": "b17992c1ae203b137d749e184af87dcf",
"assets/assets/image/Mask%2520group.png": "24c7d35d3662c77020cdc5d129063f4e",
"assets/assets/image/northwellll.svg": "1ecce7d1d8686d1dd8d29333ab555d89",
"assets/assets/image/pexels-italo-melo-881954-2379004%25201.png": "79755c316e0cd8ca417e1f87f50eb76c",
"assets/assets/image/pexels-klaus-nielsen-6303777-removebg-preview%25201.png": "cf4181ceb6ca397de1def39b9196fab1",
"assets/assets/image/Rectangle%25201910%2520(1).png": "3a17d7f9b23b3278be32e6891b40fc59",
"assets/assets/image/Rectangle%25201910%2520(2).png": "0decff2c29b6f89e547c74a5d9657425",
"assets/assets/image/Rectangle%25201910%2520(3).png": "c0e99ebd7153ebcf3c175df729fa6621",
"assets/assets/image/Rectangle%25201910.png": "4388b4aaca80893e676577fb1933f60c",
"assets/assets/image/Rectangle%2520631.png": "087592c4271f0ef91675bf17023dbf2e",
"assets/assets/image/Rectangle%2520682.png": "83375972014cd29b0be4b659706b9d68",
"assets/assets/image/Rectangle%2520683.png": "d60094c40a9bd447966751c4c8d311ed",
"assets/assets/image/smile%25201.svg": "15cc48b927f439e362e96e63f61e1a85",
"assets/assets/image/teeth.svg": "6dfd624ced4064356cbf192fc39d3630",
"assets/assets/image/underline.svg": "7e0196677418c87e432fa0e449bfddef",
"assets/assets/logo/carpe_spiritus.svg": "96913c1152830d261e88af0ba53c69b8",
"assets/assets/logo/layer1.svg": "3a2121a8b76979d32f4e395ea635b487",
"assets/assets/logo/nyu_logo_purple.svg": "79f26833e8690a867f59aa4285cfd333",
"assets/assets/logo/nyu_logo_white.svg": "4538e85dbaddd6e1dadb9e63314ece7e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "3b65609c928326f91c53aece3a39cd66",
"assets/NOTICES": "a946d656912660e303487fbe3193aa83",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "391ff5f9f24097f4f6e4406690a06243",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "44d2b84cd5de6b4f9070589ee24bbcb3",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4e4170af0430ddbf90160a7d2b8bffff",
"/": "4e4170af0430ddbf90160a7d2b8bffff",
"main.dart.js": "12edec17ab5e5cf88d7ca479ff7933d0",
"manifest.json": "d82887f113432b4b5d993191e1a58c7c",
"version.json": "140fe6951f41b220f2909b82f37044df"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
