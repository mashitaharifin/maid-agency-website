<script lang="ts">
  import { ShieldCheck } from "lucide-svelte";

  // Data from +page.server.ts
  export let data: {
    hero: { id: number; bgImage: string | null; mainHeading: string | null; subheading: string | null };
    plans: { id: number; icon: string | null; title: string | null; description: string | null }[];
    comparison: { id: number; feature: string; standard: string; enhanced: string }[];
  };

  // Action return values
  export let form;

  let editingHero = false;
  let editingPlans = false;
  let editingComparison = false;

  let draft = structuredClone(data);

  function cancel(section: string) {
    draft = structuredClone(data);
    if (section === "hero") editingHero = false;
    if (section === "plans") editingPlans = false;
    if (section === "comparison") editingComparison = false;
  }

  let files: FileList | null = null;   
  let fileName: string = "No file chosen";
  let previewSrc: string | null = null;

  $: {
    const file: File | null = files?.[0] ?? null;  
    if (file) {
      fileName = file.name;

      const reader = new FileReader();
      reader.onload = () => {
        previewSrc = reader.result as string;
      };
      reader.readAsDataURL(file);
    } else {
      fileName = "No file chosen";
      previewSrc = null;
    }
  }
</script>

<svelte:head>
  <title>Services: Insurance</title>
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
    rel="stylesheet"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
  />
</svelte:head>

<!-- SUCCESS / ERROR MESSAGE -->
{#if form?.success}
  <div class="p-3 mb-4 rounded bg-green-100 text-green-700">
    {form.message}
  </div>
{:else if form?.error}
  <div class="p-3 mb-4 rounded bg-red-100 text-red-700">
    {form.error}
  </div>
{/if}

<!-- HEADER -->
<section class="bg-white p-6 rounded-2xl shadow mb-6">
  <div class="flex items-center gap-4">
    <div class="p-2 bg-pink-100 rounded-xl">
      <ShieldCheck class="w-6 h-6 text-pink-600" />
    </div>
    <div>
      <h1 class="text-2xl font-bold text-pink-300">Insurance</h1>
      <p class="text-gray-600 text-sm">
        This page provides the information about available insurance packages.
      </p>
    </div>
  </div>
</section>

<div class="space-y-10">
    <!-- HERO -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Hero Section</h2>
      {#if !editingHero}
        <button 
          class="text-sm text-gray-600 hover:text-pink-600" 
          on:click={() => (editingHero = true)}
        >
          ✏️ Edit
        </button>
      {/if}
    </div>

    {#if editingHero}
      <form method="post" action="?/updateHero" enctype="multipart/form-data" class="space-y-4">
        <input type="hidden" name="id" value={data.hero?.id ?? ""} />

        <!-- Background Image -->
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Background Image</label>

        {#if data.hero?.bgImage}
          <img
            src={data.hero.bgImage}
            alt="Current hero background"
            class="h-32 object-cover rounded mb-2"
          />
        {/if}

        <input
          id="bgImage"
          type="file"
          name="bgImage"
          accept="image/*"
          class="hidden"
          bind:files={files}
        />

        <label
          for="bgImage"
          class="inline-block cursor-pointer px-4 py-2 bg-pink-400 text-white rounded-2xl hover:bg-pink-600 transition"
        >
          Choose File
        </label>
        <span class="ml-2 text-gray-600 italic">{fileName}</span>

        {#if previewSrc}
          <img src={previewSrc} alt="Preview" class="h-32 object-cover rounded mt-2" />
        {/if}

        <!-- Main Heading -->
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Main Heading</label>
        <input 
          type="text" 
          name="mainHeading" 
          value={data.hero?.mainHeading ?? ""} 
          class="w-full p-2 border rounded" 
        />

        <!-- Subheading -->
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Subheading</label>
        <textarea 
          name="subheading" 
          rows="2" 
          class="w-full p-2 border rounded"
        >{data.hero?.subheading ?? ""}</textarea>

        <div class="flex gap-3 mt-4">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button 
            type="button" 
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" 
            on:click={() => (editingHero = false)}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <p><b>Background:</b> 
        {#if data.hero?.bgImage}
          <img src={data.hero.bgImage} alt="Hero preview" class="h-20 object-cover inline rounded ml-2" />
        {/if}
      </p>
      <br>
      <p><b>Main Heading:</b> {data.hero?.mainHeading}</p>
      <p><b>Subheading:</b> {data.hero?.subheading}</p>
    {/if}
  </section>

  <!-- PLANS -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Insurance Plans</h2>
      {#if !editingPlans}
        <button
          class="text-sm text-gray-600 hover:text-pink-600"
          on:click={() => (editingPlans = true)}
          >✏️ Edit</button
        >
      {/if}
    </div>

    {#if editingPlans}
      <form method="post">
        {#each draft.plans as plan, i}
          <div class="mb-4 border-b pb-4">
            <input type="hidden" name="id" value={plan.id} />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-1">Icon</label>
            <input
              type="text"
              name="icon"
              bind:value={plan.icon}
              class="w-full p-2 border rounded"
            />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Title</label>
            <input
              type="text"
              name="title"
              bind:value={plan.title}
              class="w-full p-2 border rounded"
            />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Description</label>
            <textarea
              rows="2"
              name="description"
              bind:value={plan.description}
              class="w-full p-2 border rounded"
            ></textarea>
          </div>
        {/each}

        <div class="flex gap-3 mt-6">
          <button
            type="submit"
            formaction="?/updatePlans"
            class="px-5 py-2.5 bg-pink-600 text-white rounded-xl"
          >
            Save
          </button>
          <button
            type="button"
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl"
            on:click={() => cancel("plans")}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <ul class="list-disc ml-5">
        {#each data.plans as plan}
          <li>
            {plan.icon ? `${plan.icon} ` : ""}{plan.title ? `${plan.title}: ` : ""}
            {plan.description}
          </li>
        {/each}
      </ul>
    {/if}
  </section>

  <!-- COMPARISON TABLE -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Comparison Table</h2>
      {#if !editingComparison}
        <button
          class="text-sm text-gray-600 hover:text-pink-600"
          on:click={() => (editingComparison = true)}
          >✏️ Edit</button
        >
      {/if}
    </div>

    {#if editingComparison}
      <form method="post">
        {#each draft.comparison as row, i}
          <div class="mb-4 border-b pb-4">
            <input type="hidden" name="id" value={row.id} />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-1">Feature</label>
            <input
              type="text"
              name="feature"
              bind:value={row.feature}
              class="w-full p-2 border rounded"
            />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Standard</label>
            <input
              type="text"
              name="standard"
              bind:value={row.standard}
              class="w-full p-2 border rounded"
            />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Enhanced</label>
            <input
              type="text"
              name="enhanced"
              bind:value={row.enhanced}
              class="w-full p-2 border rounded"
            />
          </div>
        {/each}

        <div class="flex gap-3 mt-6">
          <button
            type="submit"
            formaction="?/updateComparison"
            class="px-5 py-2.5 bg-pink-600 text-white rounded-xl"
          >
            Save
          </button>
          <button
            type="button"
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl"
            on:click={() => cancel("comparison")}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <table class="w-full border border-gray-200 rounded-lg">
        <thead class="bg-pink-100 text-pink-600">
          <tr>
            <th class="py-2 px-4">Feature</th>
            <th class="py-2 px-4">Standard</th>
            <th class="py-2 px-4">Enhanced</th>
          </tr>
        </thead>
        <tbody>
          {#each data.comparison as row}
            <tr class="border-t">
              <td class="py-2 px-4">{row.feature}</td>
              <td class="py-2 px-4">{row.standard}</td>
              <td class="py-2 px-4">{row.enhanced}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    {/if}
  </section>
</div>
