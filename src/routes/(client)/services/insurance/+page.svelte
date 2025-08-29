<script>
    let { data } = $props();
</script>

<svelte:head>
  <title>Insurance</title>
  <meta name="description" content="Join a trusted maid agency in Singapore. Learn why working in Singapore is rewarding, our support for helpers, and opportunities for Myanmarese and Indonesian maids." />
</svelte:head>

<!-- Insurance Header -->
<section class="relative bg-cover bg-center bg-no-repeat py-32"
  style="background-image: url('{data.hero?.bgImage}')">
  <div class="absolute inset-0 bg-black/50"></div> <!-- dark overlay for readability -->

  <div class="relative max-w-5xl mx-auto text-center px-6">
    <h2 class="text-4xl md:text-5xl font-bold text-white mb-6 animate-fadeIn">
      {data.hero?.mainHeading}
    </h2>
    <p class="text-lg text-gray-100 animate-fadeIn delay-200">
      {data.hero?.subheading}
    </p>
  </div>
</section>

<section class="bg-white py-16 px-6 flex-col">
    <!-- Cards for MI and PAI -->
    <div class="relative max-w-5xl mx-auto text-center px-6 grid md:grid-cols-2 gap-8">
      <!-- Medical Insurance -->
      <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp">
        <div class="text-pink-600 mb-4 text-5xl animate-bounce">{data.plans[0]?.icon}</div>
        <h3 class="text-2xl font-semibold text-yellow-600 mb-3">{data.plans[0]?.title}</h3>
        <ul class="text-gray-800 space-y-2">
          <li>✔ {data.plans[0]?.description}</li>
          <li>✔ {data.plans[1]?.description}</li>
          <li>✔ {data.plans[2]?.description}
            <ul class="list-disc list-inside text-gray-700">
              <li>{data.plans[3]?.description}</li>
              <li>{data.plans[4]?.description}</li>
              <li>{data.plans[5]?.description}</li>
              <li>{data.plans[6]?.description}</li>
            </ul>
          </li>
        </ul>
      </div>

      <!-- Personal Accident Insurance -->
      <div class="bg-white rounded-2xl shadow-lg p-8 transform transition duration-300 hover:scale-105 hover:shadow-[0_0_30px_10px_rgba(245,185,221,0.6)] animate-slideUp delay-100">
        <div class="text-yellow-500 mb-4 text-5xl animate-bounce">{data.plans[7]?.icon}</div>
        <h3 class="text-2xl font-semibold text-yellow-600 mb-3">{data.plans[7]?.title}</h3>
        <ul class="text-gray-800 space-y-2">
          <li>✔ {data.plans[7]?.description}</li>
          <li>✔ {data.plans[8]?.description}</li>
          <li>✔ {data.plans[9]?.description}</li>
        </ul>
      </div>
    </div>

    <!-- Table for Enhanced MI -->
    <div class="mt-16 overflow-x-auto animate-slideUp delay-200">
      <table class="relative min-w-5xl mx-auto text-center px-6 bg-white rounded-2xl shadow-lg border border-gray-200">
        <thead class="bg-pink-100 text-pink-600">
          <tr>
            <th class="py-3 px-6 text-center">{data.comparisonTable[0].feature}</th>
            <th class="py-3 px-6 text-center">{data.comparisonTable[0].standard}</th>
            <th class="py-3 px-6 text-center">{data.comparisonTable[0].enhanced}</th>
          </tr>
        </thead>
        <tbody class="text-gray-800">
          <tr class="border-b border-gray-200">
            <td class="py-3 px-6 text-center">{data.comparisonTable[1].feature}</td>
            <td class="py-3 px-6 text-center">{data.comparisonTable[1].standard}</td>
            <td class="py-3 px-6 text-center">{data.comparisonTable[1].enhanced}</td>
          </tr>
          <tr class="border-b border-gray-200">
            <td class="py-3 px-6 text-center">{data.comparisonTable[2].feature}</td>
            <td class="py-3 px-6 text-center">{data.comparisonTable[2].standard}</td>
            <td class="py-3 px-6 text-center">{data.comparisonTable[2].enhanced}</td>
          </tr>
          <tr class="border-b border-gray-200">
            <td class="py-3 px-6 text-center">{data.comparisonTable[3].feature}</td>
            <td class="py-3 px-6 text-center">{data.comparisonTable[3].standard}</td>
            <td class="py-3 px-6 text-center">{data.comparisonTable[3].enhanced}</td>
          </tr>
          <tr>
            <td class="py-3 px-6 text-center">{data.comparisonTable[4].feature}</td>
            <td class="py-3 px-6 text-center">{data.comparisonTable[4].standard}</td>
            <td class="py-3 px-6 text-center">{data.comparisonTable[4].enhanced}</td>
          </tr>
        </tbody>
      </table>
    </div>
</section>

<p class="text-sm text-center text-gray-500 mt-8">
  Information sourced from the 
  <a href="https://www.mom.gov.sg/passes-and-permits/work-permit-for-foreign-domestic-worker/eligibility-and-requirements/insurance-requirements" 
     target="_blank" 
     class="text-pink-600 hover:text-yellow-600 underline">
    Ministry of Manpower (MOM) Singapore 
  </a>. 
</p><br>


<!-- Tailwind Animations -->
<style>
  @keyframes fadeIn { from {opacity:0;} to {opacity:1;} }
  .animate-fadeIn { animation: fadeIn 1s ease forwards; }

  @keyframes slideUp { from {opacity:0; transform:translateY(20px);} to {opacity:1; transform:translateY(0);} }
  .animate-slideUp { animation: slideUp 0.8s ease forwards; }

  @keyframes bounce { 0%, 100% {transform: translateY(0);} 50% {transform: translateY(-10px);} }
  .animate-bounce { animation: bounce 2s infinite; }

  /* Delay helper */
  .delay-100 { animation-delay: 0.1s; }
  .delay-200 { animation-delay: 0.2s; }
</style>
