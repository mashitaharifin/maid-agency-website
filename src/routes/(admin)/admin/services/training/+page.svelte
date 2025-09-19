<script lang="ts">
  import { GraduationCap } from "lucide-svelte";

  // Data from +page.server.ts
  export let data: {
    hero: { id: number; bgImage: string; mainHeading: string; subheading: string } | null;
    trainings: { id: number; sectionTitle: string; icon: string; title: string; description: string }[];
    plans: { id: number; sectiontitle: string; title: string | null; description: string | null }[];
  };

  // Action return values
  export let form;

  let editingHero = false;
  let editingTrainings = false;
  let editingPlans = false;

  let draft = structuredClone(data);

  // ✅ Ensure hero object always exists
  if (!draft.hero) {
    draft.hero = { id: 0, bgImage: "", mainHeading: "", subheading: "" };
  }

  function cancel(section: string) {
    draft = structuredClone(data);
    if (!draft.hero) {
      draft.hero = { id: 0, bgImage: "", mainHeading: "", subheading: "" };
    }
    if (section === "hero") editingHero = false;
    if (section === "trainings") editingTrainings = false;
    if (section === "plans") editingPlans = false;
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
  <title>Services: Pre-Employment Training</title>
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
      <GraduationCap class="w-6 h-6 text-pink-600" />
    </div>
    <div>
      <h1 class="text-2xl font-bold text-pink-300">Pre-Employment Training</h1>
      <p class="text-gray-600 text-sm">
        This page provides the information about trainings modules for maids.
      </p>
    </div>
  </div>
</section>

<div class="space-y-10">
  <!-- HERO SECTION -->
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
          <img src={data.hero.bgImage} alt="Current hero background" class="h-32 object-cover rounded mb-2" />
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

        <div class="flex gap-3 mt-6">
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

  <!-- TRAININGS SECTION (3 columns × 5 rows, kept exactly as before) -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Training Modules</h2>
      {#if !editingTrainings}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingTrainings = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingTrainings}
      <form method="post">
        <div class="grid md:grid-cols-3 gap-6">
          {#each [0,5,10] as start}
            <div class="space-y-3 border p-4 rounded-xl">
              <input type="hidden" name="ids[]" value={draft.trainings[start].id} />
              <input class="w-full border p-2 rounded" name="icon[]" bind:value={draft.trainings[start].icon} placeholder="Icon" />
              <input class="w-full border p-2 rounded" name="title[]" bind:value={draft.trainings[start].title} placeholder="Title" />
              {#each Array(5) as _, i}
                <input
                  class="w-full border p-2 rounded"
                  name="description[]"
                  bind:value={draft.trainings[start+i].description}
                  placeholder="Description {i+1}" />
              {/each}
            </div>
          {/each}
        </div>

        <div class="mt-4 flex gap-3">
          <button type="submit" formaction="?/updateTrainings" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" on:click={() => cancel("trainings")} class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl">Cancel</button>
        </div>
      </form>
    {:else}
      <div class="grid md:grid-cols-3 gap-6">
        <div>
          <h3 class="font-semibold text-pink-600">{data.trainings[0]?.title}</h3>
          <ul class="list-disc ml-5 text-gray-700">
            {#each data.trainings.slice(0,5) as t}
              <li>{t.description}</li>
            {/each}
          </ul>
        </div>
        <div>
          <h3 class="font-semibold text-pink-600">{data.trainings[5]?.title}</h3>
          <ul class="list-disc ml-5 text-gray-700">
            {#each data.trainings.slice(5,10) as t}
              <li>{t.description}</li>
            {/each}
          </ul>
        </div>
        <div>
          <h3 class="font-semibold text-pink-600">{data.trainings[10]?.title}</h3>
          <ul class="list-disc ml-5 text-gray-700">
            {#each data.trainings.slice(10,15) as t}
              <li>{t.description}</li>
            {/each}
          </ul>
        </div>
      </div>
    {/if}
  </section>

  <!-- WHY CHOOSE US SECTION -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Why Choose Us</h2>
      {#if !editingPlans}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingPlans = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingPlans}
      <form method="post">
        {#each draft.plans as plan, i}
          <div class="mb-4 border-b pb-4">
            <input type="hidden" name="ids[]" value={plan.id} />

            {#if plan.sectiontitle}
              <!-- svelte-ignore a11y_label_has_associated_control -->
              <label class="block mb-1">Section Title</label>
              <input type="text" name="sectiontitle[]" bind:value={plan.sectiontitle} class="w-full p-2 border rounded" />
            {/if}

            {#if plan.title}
              <!-- svelte-ignore a11y_label_has_associated_control -->
              <label class="block mb-1">Title</label>
              <input type="text" name="title[]" bind:value={plan.title} class="w-full p-2 border rounded" />
            {/if}

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Description</label>
            <textarea rows="2" name="description[]" bind:value={plan.description} class="w-full p-2 border rounded"></textarea>
          </div>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" formaction="?/updatePlans" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" on:click={() => cancel("plans")} class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl">Cancel</button>
        </div>
      </form>
    {:else}
      <h3 class="font-semibold text-gray-800 mb-2">{data.plans[0]?.sectiontitle}</h3>
      <ul class="list-disc ml-5">
        {#each data.plans as p}
          <li><b>{p.title}:</b> {p.description}</li>
        {/each}
      </ul>
    {/if}
  </section>
</div>
