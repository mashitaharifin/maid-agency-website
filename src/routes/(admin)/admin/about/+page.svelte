<script lang="ts">
  import { Info } from "lucide-svelte";

  export let data: {
    hero: { id: number; bgImage: string; mainHeading: string; subheading: string } | null;
    missionVision: { id: number; type: string; title: string; description: string }[];
    coreValues: { id: number; emoji: string; value: string; description: string }[];
    findUs: { id: number; title: string; description: string; gmapLink: string } | null;
  };

  export let form: { success?: string } | null;

  let editingHero = false;
  let editingMissionVision = false;
  let editingCoreValues = false;
  let editingFindUs = false;

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
  <title>About Us</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</svelte:head>

{#if form?.success}
  <div class="mb-4 p-3 bg-green-100 text-green-700 border border-green-300">
    {form.success}
  </div>
{/if}

<section class="bg-white p-6 rounded-2xl shadow mb-6">
  <div class="flex items-center gap-4">
    <div class="p-2 bg-pink-100 rounded-xl">
      <Info class="w-6 h-6 text-pink-600" />
    </div>
    <div>
      <h1 class="text-2xl font-bold text-pink-300">About Us</h1>
      <p class="text-gray-600 text-sm">This page provides details about the company.</p>
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

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Background Image</label>

        {#if data.hero?.bgImage}
          <img
            src={data.hero.bgImage}
            alt="Current hero background"
            class="h-32 object-cover rounded mb-2"
          />
        {/if}

        <!-- Hidden file input -->
        <input
          id="bgImage"
          type="file"
          name="bgImage"
          accept="image/*"
          class="hidden"
          bind:files={files}
        />

        <!-- Custom styled button -->
        <label
          for="bgImage"
          class="inline-block cursor-pointer px-4 py-2 bg-pink-400 text-white rounded-2xl hover:bg-pink-600 transition"
        >Choose File</label>
        <span id="file-chosen" class="ml-2 text-gray-600 italic">No file chosen</span>

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Main Heading</label>
        <input 
          type="text" 
          name="mainHeading" 
          value={data.hero?.mainHeading ?? ""} 
          class="w-full p-2 border rounded" 
        />

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

  <!-- MISSION & VISION -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Mission & Vision</h2>
      {#if !editingMissionVision}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingMissionVision = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingMissionVision}
      <form method="post" action="?/updateMissionVision" class="space-y-6">
        {#each data.missionVision as item}
          <input type="hidden" name="id" value={item.id} />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block capitalize">{item.type} Title</label>
          <input type="text" name="title" value={item.title} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block capitalize">{item.type} Description</label>
          <textarea name="description" rows="2" class="w-full p-2 border rounded">{item.description}</textarea>
        {/each}

        <div class="flex gap-3 mt-4">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => (editingMissionVision = false)}>Cancel</button>
        </div>
      </form>
    {:else}
      {#each data.missionVision as item}
        <p><b>{item.title}</b>: {item.description}</p>
      {/each}
    {/if}
  </section>

  <!-- CORE VALUES -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Core Values</h2>
      {#if !editingCoreValues}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingCoreValues = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingCoreValues}
      <form method="post" action="?/updateCoreValues" class="space-y-6">
        {#each data.coreValues as core}
          <input type="hidden" name="id" value={core.id} />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block">Emoji</label>
          <input type="text" name="emoji" value={core.emoji} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block">Value</label>
          <input type="text" name="value" value={core.value} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block">Description</label>
          <textarea name="description" rows="2" class="w-full p-2 border rounded">{core.description}</textarea>
        {/each}

        <div class="flex gap-3 mt-4">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => (editingCoreValues = false)}>Cancel</button>
        </div>
      </form>
    {:else}
      <ul class="space-y-2">
        {#each data.coreValues as core}
          <li>{core.emoji} <b>{core.value}</b>: {core.description}</li>
        {/each}
      </ul>
    {/if}
  </section>

  <!-- FIND US -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Find Us</h2>
      {#if !editingFindUs}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingFindUs = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingFindUs}
      <!-- svelte-ignore a11y_label_has_associated_control -->
      <form method="post" action="?/updateFindUs" class="space-y-4">
        <input type="hidden" name="id" value={data.findUs?.id ?? ""} />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Title</label>
        <input type="text" name="title" value={data.findUs?.title ?? ""} class="w-full p-2 border rounded" />

        <label class="block">Description</label>
        <textarea name="description" rows="2" class="w-full p-2 border rounded">{data.findUs?.description ?? ""}</textarea>

        <label class="block">Google Maps Link</label>
        <input type="text" name="gmapLink" value={data.findUs?.gmapLink ?? ""} class="w-full p-2 border rounded break-words" />

        <div class="flex gap-3 mt-4">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => (editingFindUs = false)}>Cancel</button>
        </div>
      </form>
    {:else}
      <p><b>{data.findUs?.title}</b>: {data.findUs?.description}</p>
      <p class="break-words"><b>Map Link:</b> {data.findUs?.gmapLink}</p>
    {/if}
  </section>
</div>
