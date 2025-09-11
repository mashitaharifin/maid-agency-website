<script lang="ts">
    import type { PageData } from "./$types";

  interface Props {
    data: PageData
  }
  let {
    data
  }: Props = $props()
  $inspect(data)
  
</script>

<svelte:head>
  <title>Maid Search Singapore</title>
  <meta name="description" content="Join a trusted maid agency in Singapore. Learn why working in Singapore is rewarding, our support for helpers, and opportunities for Myanmarese and Indonesian maids." />
</svelte:head>

<!-- HERO SECTION -->
<section class="relative h-[50vh] flex items-center justify-center bg-gray-900 text-white">
  <!-- Background image -->
  <div class="absolute inset-0">
    <img src={data.hero?.bgImage} alt="Maid Agency Header" class="w-full h-full object-cover" />
    <!-- Overlay -->
    <div class="absolute inset-0 bg-black/50"></div>
  </div>
  <!-- Content -->
  <div class="relative text-center px-6 max-w-3xl">
    <h1 class="text-4xl md:text-4xl font-bold mb-4 drop-shadow-lg">
      {data.hero?.mainHeading}
    </h1>
    <p class="mt-4 mb-12 text-gray-100 text-xl animate-fadeIn delay-200">
      {data.hero?.subheading}
    </p>
  </div>
</section>

<!-- ABOUT US SECTION -->
<section class="py-20 bg-white">
  <div class="max-w-5xl mx-auto px-6 text-center animate-fadeIn">
    <h2 class="text-3xl text-[#eb4fa7] font-bold mb-6">About Us</h2>
    <p class="text-lg text-gray-700 mb-6">
      {data.welcome.description}
    </p>
    <a href="/about" 
       class="inline-block px-6 py-3 rounded-full bg-[#eb4fa7] hover:bg-gradient-to-r from-[#f5b9dd] to-[#ebd07a] text-white font-semibold 
              hover:bg-[#D4AF37] transition">
      Learn More
    </a>
  </div>
</section>

<!-- AWARD SECTION -->
<section class="py-16 bg-gray-50">
  <div class="max-w-4xl mx-auto px-6 text-center animate-slideUp">
    <h2 class="text-3xl font-bold text-[#ebb84f] mb-6">{data.recognitions?.sectionTitle}</h2>
    <p class="text-gray-700 text-lg mb-6">
      {data.recognitions?.caption}
    </p>
    <div class="flex justify-center">
      <!-- Trigger button (certificate image) -->
      <button data-modal-target="certificateModal" data-modal-toggle="certificateModal">
        <img src={data.recognitions?.urlImage}
             alt="Singapore Excellence Award Certificate" 
             class="w-64 rounded-xl shadow-lg hover:scale-105 transition cursor-pointer" />
      </button>
    </div>
  </div>
</section>

<!-- Modal -->
<div id="certificateModal" tabindex="-1" aria-hidden="true"
     class="hidden fixed inset-0 z-50 items-center justify-center w-full h-full overflow-y-auto overflow-x-hidden 
            bg-black/50 backdrop-blur-sm">
  <div class="relative p-4 w-full max-w-3xl">
    <!-- Modal content -->
    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
      
      <!-- Close button -->
      <button type="button" 
              class="absolute top-3 right-3 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 
                     rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center 
                     dark:hover:bg-gray-600 dark:hover:text-white" 
              data-modal-hide="certificateModal">
        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
        </svg>
        <span class="sr-only">Close modal</span>
      </button>

      <!-- Modal body -->
      <div class="p-6 flex justify-center">
        <img src="/images/certificate.jpg" alt="Singapore Excellence Award Certificate" class="rounded-lg max-h-[80vh]" />
      </div>
    </div>
  </div>
</div>

<!-- SERVICES SECTION -->
<section class="py-20 bg-gray-50">
  <div class="max-w-6xl mx-auto px-6 text-center">
    <h2 class="text-3xl text-[#eb4fa7] font-bold mb-12">{data.services[0].title}</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
      
      <!-- Myanmar Maids -->
      <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 
        hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)]">
        <h3 class="text-2xl text-[#ebb84f] font-semibold mb-4">{data.services[0].maidType}</h3>
        <p class="mb-4">{data.services[0].description}</p>
        <a href="/services/maid" class="text-pink-500 hover:text-[#D4AF37] italic">Learn More</a>
      </div>

      <!-- Indonesian Maids -->
      <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 
        hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)]">
        <h3 class="text-2xl text-[#ebb84f] font-semibold mb-4">{data.services[1].maidType}</h3>
        <p class="mb-4">{data.services[1].description}</p>
        <a href="/services/maid" class="text-pink-500 hover:text-[#D4AF37] italic">Learn More</a>
      </div>
    </div>
  </div>
</section>

<!-- REVIEWS SECTION -->
<section class="py-20 bg-white">
  <div class="max-w-6xl mx-auto px-6">
    <h2 class="text-3xl text-[#ebb84f] font-bold text-center mb-12">{data.reviews[0]?.title}</h2>
    <div class="grid md:grid-cols-3 gap-8">
      {#each data.reviews as review}
        <div class="bg-gray-50 p-6 rounded-xl shadow-md hover:shadow-xl transition animate-fadeIn">
          
          <!-- Stars -->
          <div class="flex justify-center mb-3 text-[#ebb84f]">
            {#each Array(5) as _, i}
              <svg xmlns="http://www.w3.org/2000/svg" 
                   viewBox="0 0 20 20" 
                   fill="currentColor" 
                   class="w-5 h-5">
                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.286 3.966a1 1 0 00.95.69h4.178c.969 0 1.371 1.24.588 1.81l-3.385 2.46a1 1 0 00-.364 1.118l1.287 3.966c.3.921-.755 1.688-1.54 1.118l-3.386-2.46a1 1 0 00-1.176 0l-3.386 2.46c-.784.57-1.838-.197-1.539-1.118l1.287-3.966a1 1 0 00-.364-1.118L2.097 9.393c-.783-.57-.38-1.81.588-1.81h4.178a1 1 0 00.95-.69l1.286-3.966z" />
              </svg>
            {/each}
          </div>

          <!-- Review text -->
          <p class="italic mb-4">{review.reviewText}</p>
          <p class="font-semibold text-[#eb4fa7]">- {review.reviewerName}</p>
        </div>
      {/each}
    </div>
  </div>
</section>
