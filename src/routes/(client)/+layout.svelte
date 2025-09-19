<script lang="ts">
	import '../../app.css';
	import favicon from '$lib/assets/logo.png'
	import 'flowbite';
	let { data, children } = $props();
  const footer = data.globalContent;
  const navBar = data.globalContent;
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<!-- NAVBAR -->
<nav class="bg-white border-gray-200 dark:bg-gray-900">
  <div class="flex flex-wrap items-center justify-between max-w-screen-xl mx-auto p-4">
    <!-- LEFT SIDE: Logo + Agency Name -->
    <div class="flex items-center space-x-3">
      <img src="images/logo.png" class="h-8" alt="logo" />
      <a href="/" class="text-xl font-bold text-gray-800 dark:text-white">{navBar.agencyName}</a>
    </div>

    <!-- Toggle -->
    <div class="flex items-center md:order-2 space-x-1 md:space-x-2 rtl:space-x-reverse">
      <button data-collapse-toggle="mega-menu" type="button" 
          class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 
                 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 
                 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" 
          aria-controls="mega-menu" aria-expanded="false">
        <span class="sr-only">Open main menu</span>
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" 
            viewBox="0 0 17 14">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                d="M1 1h15M1 7h15M1 13h15"/>
        </svg>
      </button>
    </div>

    <!-- NAV LINKS (Mega Menu) -->
    <div id="mega-menu" class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1">
      <ul class="flex flex-col mt-4 font-medium md:flex-row md:mt-0 md:space-x-8 rtl:space-x-reverse">
        
        <!-- Home -->
        <li>
          <a href="/" 
            class="block py-2 px-3 text-[#B8860B] border-b border-gray-100 dark:border-gray-700 hover:bg-gray-50 
            md:hover:bg-transparent md:border-0 md:hover:text-[#f5b9dd] md:p-0">
            Home
          </a>
        </li>

        <!-- Our Services (Dropdown) -->
        <li class="relative">
          <button id="services-dropdown-button" data-dropdown-toggle="services-dropdown" 
            class="flex items-center justify-between w-full py-2 px-3 dark:text-white font-medium text-gray-900 
            border-b border-gray-100 dark:border-gray-700 md:w-auto hover:bg-gray-50 md:hover:bg-transparent md:border-0 
            md:hover:text-[#f5b9dd] md:p-0">
            Our Services
            <svg class="w-2.5 h-2.5 ms-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </button>

          <!-- Dropdown Menu -->
          <div id="services-dropdown" 
            class="absolute z-10 hidden w-48 bg-white rounded-lg shadow-md border border-gray-100 dark:border-gray-700 md:mt-2">
            <ul class="py-2 text-sm text-gray-700">
              <li>
                <a href="/services/maid" class="block px-4 py-2 hover:bg-gray-100 hover:text-[#f5b9dd]">Maid</a>
              </li>
              <li>
                <a href="/services/pre-employment-training" class="block px-4 py-2 hover:bg-gray-100 hover:text-[#f5b9dd]">Pre-Employment Training</a>
              </li>
              <li>
                <a href="/services/insurance" class="block px-4 py-2 hover:bg-gray-100 hover:text-[#f5b9dd]">Insurance</a>
              </li>
            </ul>
          </div>
        </li>

        <!-- About Us -->
        <li>
          <a href="/about" 
            class="block py-2 px-3 text-gray-900 dark:text-white border-b border-gray-100 dark:border-gray-700 hover:bg-gray-50 
            md:hover:bg-transparent md:border-0 md:hover:text-[#f5b9dd] md:p-0">
            About Us
          </a>
        </li>

        <!-- Find Your Helper -->
        <li>
          <a href="/findhelper" 
            class="block py-2 px-3 text-gray-900 dark:text-white border-b border-gray-100 dark:border-gray-700 hover:bg-gray-50 
            md:hover:bg-transparent md:border-0 md:hover:text-[#f5b9dd] md:p-0">
            Find Your Helper
          </a>
        </li>

      </ul>
    </div>

  </div>
</nav>

<!-- PAGE CONTENT -->
{@render children()}

<!-- Floating WhatsApp CTA  -->
<a
  href="{footer?.whatsappLink}"
  target="_blank"
  rel="noopener"
  class="fixed bottom-4 right-4 inline-flex items-center gap-2 rounded-full px-5 py-3 text-white bg-[#00C9A7] hover:bg-gradient-to-r from-[#f5b9dd] to-[#ebd07a] shadow-lg active:scale-[0.98] transition"
  aria-label="Chat on WhatsApp"
>
  <!-- icon -->
  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="currentColor">
    <path d="M.057 24l1.687-6.163A11.867 11.867 0 0111.94 0C18.6 0 24 5.373 24 12.01 24 18.647 18.6 24 11.94 24a11.9 11.9 0 01-6.1-1.69L.057 24z"/>
    <path d="M17.5 14.37c-.1-.16-.36-.26-.76-.45-.41-.18-2.4-1.18-2.77-1.32-.37-.14-.64-.21-.9.21-.26.42-1.03 1.32-1.26 1.59-.23.26-.46.3-.86.11-.4-.2-1.68-.62-3.2-1.98-1.18-1.05-1.97-2.35-2.2-2.75-.23-.41-.02-.63.17-.85.18-.22.41-.57.62-.86.2-.3.27-.51.4-.85.13-.34.07-.64-.03-.9-.11-.26-.9-2.18-1.23-2.98-.33-.79-.67-.68-.9-.69l-.77-.01c-.26 0-.68.1-1.03.5-.35.39-1.35 1.32-1.35 3.2 0 1.88 1.39 3.7 1.58 3.96.2.26 2.74 4.19 6.62 5.87.93.4 1.66.64 2.23.82.93.29 1.77.25 2.44.15.74-.11 2.4-.98 2.74-1.93.34-.95.34-1.77.24-1.93z"/>
  </svg>
  Chat
</a>

<!-- FOOTER -->
<footer class="bg-gradient-to-r from-[#f5b9dd] to-[#D4AF37] text-white py-12">
  <div class="max-w-6xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-14">
    
    <div>
      <h4 class="font-bold mb-4 text-lg">Contact Us</h4>
      <p class="flex items-start gap-2">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 flex-shrink-0 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 
          1.343-3 3 1.343 3 3 3zM12 22s8-4.5 8-11a8 8 0 10-16 0c0 6.5 8 11 8 11z" />
        </svg>
        Machperson Mall<br>401 Macpherson Road<br>#02-02<br>Singapore 329802
      </p>

      <p class="flex items-center gap-2 mt-3">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 flex-shrink-0 text-white" fill="currentColor" viewBox="0 0 24 24">
          <path d="M22 12a10 10 0 1 0-11.5 9.9v-7H8v-3h2.5V9.5c0-2.5 1.5-3.9 3.7-3.9 1.1 0 2.2.2 2.2.2v2.4h-1.2c-1.2 0-1.6.8-1.6 1.5V12H16l-.5 3h-2.2v7A10 10 0 0 0 22 12z"/>
        </svg>
        <a href={footer?.facebookLink} target="_blank" class="hover:italic">
          Maid Search Singapore Pte Ltd
        </a>
      </p>

      <p class="flex items-center gap-2 mt-3">
        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 flex-shrink-0 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
            d="M3 5a2 2 0 012-2h3.28a2 2 0 011.94 1.515l.58 2.32a2 2 0 
            01-.45 1.77L9.12 10.88a16 16 0 006 6l2.27-2.23a2 2 0 
            011.77-.45l2.32.58a2 2 0 011.515 1.94V19a2 2 0 
            01-2 2h-1C10.61 21 3 13.39 3 5V5z" />
        </svg>
        <a href="tel:+6596825955" class="hover:italic">
          {footer?.phone}
        </a>
      </p>
    </div>

    <div>
      <h4 class="font-bold mb-4 text-lg">Our Maids</h4>
      <ul class="space-y-2">
        <li><a href="/services/maid" class="hover:text-pink-500 hover:font-bold">Myanmarese Maids</a></li>
        <li><a href="/services/maid" class="hover:text-pink-500 hover:font-bold">Indonesian Maid</a></li>
      </ul>
    </div>

    <div>
      <h4 class="font-bold mb-4 text-lg">Our Services</h4>
      <ul class="space-y-2">
        <li><a href="/services/maid" class="hover:text-pink-500 hover:font-bold">Maid</a></li>
        <li><a href="/services/pre-employment-training" class="hover:text-pink-500 hover:font-bold">Pre-Employment Training</a></li>
        <li><a href="/services/insurance" class="hover:text-pink-500 hover:font-bold">Insurance</a></li>
      </ul>
    </div>

    <div>
      <h4 class="font-bold mb-4 text-lg">Training</h4>
      <ul class="space-y-2">
        <li><a href="/services/pre-employment-training" class="hover:text-pink-500 hover:font-bold">Infant Care</a></li>
        <li><a href="/services/pre-employment-training" class="hover:text-pink-500 hover:font-bold">Elder Care</a></li>
        <li><a href="/services/pre-employment-training" class="hover:text-pink-500 hover:font-bold">Housekeeping</a></li>
      </ul>
    </div>

  </div>

  <!-- Company Info -->
  <div class="mt-8 text-center text-xs text-white/80 space-y-1">
    <p>License No: {footer?.licenseNo}</p>
    <p>Company Registration No: {footer?.companyNo}</p>
    <p>Employment Agency Registration No: {footer?.empRegNo}</p>
  </div>

  <!-- Copyright -->
  <div class="mt-4 text-center text-sm font-bold">{footer?.copyright}</div>
</footer>
