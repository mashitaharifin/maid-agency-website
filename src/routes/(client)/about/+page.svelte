<script lang="ts">
  let { data } = $props();
  const { hero, missionVision } = data;
  const mission = missionVision.find((item) => item.type === "mission");
  const vision = missionVision.find((item) => item.type === "vision");
</script>

<svelte:head>
  <title>About Us</title>
  <meta name="description" content="Join a trusted maid agency in Singapore. Learn why working in Singapore is rewarding, our support for helpers, and opportunities for Myanmarese and Indonesian maids." />
</svelte:head>

<!-- About Us Header -->
<section class="relative bg-cover bg-center bg-no-repeat py-32"
  style={`background-image: url('${hero?.bgImage ?? "/images/header7.jpg"}')`}>
  <div class="absolute inset-0 bg-black/50"></div> <!-- overlay -->

  <div class="relative max-w-4xl mx-auto text-center px-6">
    <h1 class="text-4xl md:text-6xl font-bold text-white mb-6 animate-fadeIn">
      {hero?.mainHeading}
    </h1>
    
    <p class="max-w-3xl mx-auto text-gray-100 animate-fadeIn delay-200">
      {hero?.subheading}
    </p>
  </div>
</section>

<section class="bg-white py-16 px-6">
  <!-- Mission & Vision -->
  <div class="max-w-7xl mx-auto grid md:grid-cols-2 gap-8 mt-16">
    {#if mission}
      <div
        class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp"
      >
        <h3 class="text-3xl font-bold text-pink-600 mb-4">{mission.title}</h3>
        <p class="text-gray-700">{mission.description}</p>
      </div>
    {/if}

    {#if vision}
      <div
        class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp delay-100"
      >
        <h3 class="text-3xl font-bold text-yellow-600 mb-4">{vision.title}</h3>
        <p class="text-gray-700">{vision.description}</p>
      </div>
    {/if}
  </div>

  <!-- Core Values -->
  <div class="max-w-7xl mx-auto mt-20 text-center">
    <h2 class="text-4xl font-bold text-pink-600 mb-12 animate-fadeIn">{data.coreValues[0].title}</h2>
    <div class="grid md:grid-cols-3 gap-8">
      {#each data.coreValues as coreValue, i}
      <div
        class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp"
        style="animation-delay: {i * 100}ms"
      >
        <div class="text-pink-600 text-5xl mb-4 animate-bounce">
          {coreValue.emoji}
        </div>
        <h3 class="text-2xl font-semibold text-pink-600 mb-2">
          {coreValue.value}
        </h3>
        <p class="text-gray-700">{coreValue.description}</p>
      </div>
    {/each}
    </div>
  </div>

  <!-- Google Map -->
  <div class="max-w-7xl mx-auto mt-20 text-center animate-fadeIn delay-200">
    <h2 class="text-4xl font-bold text-yellow-600 mb-6">{data.findUs?.title}</h2>
    <p class="text-gray-700 mb-6">{data.findUs?.description}</p>
    <div class="w-full h-[400px] rounded-2xl shadow-lg overflow-hidden">
      <!-- Replace with your HQ's actual map embed link -->
      <!-- svelte-ignore a11y_missing_attribute -->
      <iframe src={data.findUs.gmapLink}
        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy">
      </iframe>
    </div>
  </div>

</section>

<!-- Tailwind Animations -->
<style>
  @keyframes fadeIn { from {opacity:0;} to {opacity:1;} }
  .animate-fadeIn { animation: fadeIn 1s ease forwards; }

  @keyframes slideUp { from {opacity:0; transform:translateY(20px);} to {opacity:1; transform:translateY(0);} }
  .animate-slideUp { animation: slideUp 0.8s ease forwards; }

  @keyframes bounce { 0%, 100% {transform: translateY(0);} 50% {transform: translateY(-8px);} }
  .animate-bounce { animation: bounce 2s infinite; }

  /* Delay helpers */
  .delay-100 { animation-delay: 0.1s; }
  .delay-200 { animation-delay: 0.2s; }
</style>
