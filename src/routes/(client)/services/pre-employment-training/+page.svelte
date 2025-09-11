<script lang="ts">
  let { data } = $props();
</script>

<svelte:head>
  <title>Pre-Employment Training</title>
  <meta name="description" content="Join a trusted maid agency in Singapore. Learn why working in Singapore is rewarding, our support for helpers, and opportunities for Myanmarese and Indonesian maids." />
</svelte:head>

<section class="relative bg-cover bg-center bg-no-repeat py-32"
  style="background-image: url({data.hero?.bgImage});">
  <!-- Dark overlay -->
  <div class="absolute inset-0 bg-black/50"></div>

  <!-- Header Content -->
  <div class="relative max-w-4xl mx-auto text-center px-4">
    <h1 class="text-4xl md:text-5xl font-bold text-white drop-shadow-lg animate-fadeIn">
      {data.hero?.mainHeading}
    </h1>
    <p class="mt-4 mb-12 text-gray-100 animate-fadeIn delay-200">
      {data.hero?.subheading} </p>
  </div>
</section>

<section class="bg-gray-50 py-16">
  <h3 class="text-3xl text-center font-bold text-pink-600 mb-4 animate-fadeIn delay-600">
      {data.trainingsData[0]?.sectionTitle}
    </h3>
  <!-- Subsections -->
  <div class="mt-12 max-w-6xl mx-auto grid gap-10 md:grid-cols-3 px-6">
    <!-- Infant Care -->
    <div class="bg-pink-50 border-t-4 border-pink-500 rounded-2xl shadow-lg p-6 
                hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp">
      <div class="flex items-center justify-center w-16 h-16 bg-pink-500 rounded-full mx-auto mb-4 
                  hover:rotate-12 transition duration-300">
        <span class="text-white text-2xl">{data.trainingsData[0]?.icon}</span>
      </div>
      <h2 class="text-xl font-bold text-pink-600 text-center mb-3">{data.trainingsData[0]?.title}</h2>
      <ul class="space-y-2 text-gray-700 text-sm">
        <li>{data.trainingsData[0]?.description}</li>
        <li>{data.trainingsData[1]?.description}</li>
        <li>{data.trainingsData[2]?.description}</li>
        <li>{data.trainingsData[3]?.description}</li>
        <li>{data.trainingsData[4]?.description}</li>
      </ul>
    </div>

    <!-- Elderly Care -->
    <div class="bg-yellow-50 border-t-4 border-yellow-500 rounded-2xl shadow-lg p-6 
                hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp delay-200">
      <div class="flex items-center justify-center w-16 h-16 bg-yellow-500 rounded-full mx-auto mb-4 
                  hover:rotate-12 transition duration-300">
        <span class="text-white text-2xl">{data.trainingsData[5]?.icon}</span>
      </div>
      <h2 class="text-xl font-bold text-yellow-600 text-center mb-3">{data.trainingsData[5]?.title}</h2>
      <ul class="space-y-2 text-gray-700 text-sm">
        <li>{data.trainingsData[5]?.description}</li>
        <li>{data.trainingsData[6]?.description}</li>
        <li>{data.trainingsData[7]?.description}</li>
        <li>{data.trainingsData[8]?.description}</li>
        <li>{data.trainingsData[9]?.description}</li>
      </ul>
    </div>

    <!-- Housekeeping -->
    <div class="bg-pink-50 border-t-4 border-pink-500 rounded-2xl shadow-lg p-6 
                hover:shadow-2xl hover:scale-105 transform transition duration-300 ease-in-out animate-slideUp delay-400">
      <div class="flex items-center justify-center w-16 h-16 bg-pink-500 rounded-full mx-auto mb-4 
                  hover:rotate-12 transition duration-300">
        <span class="text-white text-2xl">{data.trainingsData[10]?.icon}</span>
      </div>
      <h2 class="text-xl font-bold text-pink-600 text-center mb-3">{data.trainingsData[10]?.title}</h2>
      <ul class="space-y-2 text-gray-700 text-sm">
        <li>{data.trainingsData[10]?.description}</li>
        <li>{data.trainingsData[11]?.description}</li>
        <li>{data.trainingsData[12]?.description}</li>
        <li>{data.trainingsData[13]?.description}</li>
        <li>{data.trainingsData[14]?.description}</li>
      </ul>
    </div>

  </div>

  <!-- Why Choose Us -->
  <div class="mt-16 max-w-5xl mx-auto px-6 text-center">
    <h3 class="text-2xl font-bold text-pink-600 mb-4 animate-fadeIn delay-600">
      {data.plans[0]?.sectiontitle}
    </h3>
    <div class="grid md:grid-cols-3 gap-6">
      <div class="p-4 bg-yellow-50 rounded-xl shadow-md hover:scale-105 transition duration-300">
        <p class="font-semibold text-yellow-600">{data.plans[0]?.title}</p>
        <p class="text-gray-600 text-sm">{data.plans[0]?.description}</p>
      </div>
      <div class="p-4 bg-pink-50 rounded-xl shadow-md hover:scale-105 transition duration-300">
        <p class="font-semibold text-pink-600">{data.plans[1]?.title}</p>
        <p class="text-gray-600 text-sm">{data.plans[1]?.description}</p>
      </div>
      <div class="p-4 bg-yellow-50 rounded-xl shadow-md hover:scale-105 transition duration-300">
        <p class="font-semibold text-yellow-600">{data.plans[2]?.title}</p>
        <p class="text-gray-600 text-sm">{data.plans[2]?.description}</p>
      </div>
    </div>
  </div>
</section>

<style>
  /* Simple fade and slide animations */
  @keyframes fadeIn {
    0% { opacity: 0; transform: translateY(10px); }
    100% { opacity: 1; transform: translateY(0); }
  }
  @keyframes slideUp {
    0% { opacity: 0; transform: translateY(40px); }
    100% { opacity: 1; transform: translateY(0); }
  }

  .animate-fadeIn {
    animation: fadeIn 1s ease forwards;
  }
  .animate-slideUp {
    animation: slideUp 1s ease forwards;
  }
  .delay-200 { animation-delay: 0.2s; }
  .delay-400 { animation-delay: 0.4s; }
  .delay-600 { animation-delay: 0.6s; }
</style>
