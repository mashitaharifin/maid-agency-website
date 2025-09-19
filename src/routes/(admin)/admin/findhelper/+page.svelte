<script lang="ts">
  import { Search } from "lucide-svelte";

  export let data: {
    cta: any;
    hero: { id: number; bgImage: string; mainHeading: string; subheading: string } | null;
    steps: { id: number; stepNo: string; icon: string; title: string; description: string; sectionTitle: string | null }[];
    choose: { id: number; icon: string; reason: string; description: string; sectionTitle: string | null }[];
    faqs: { id: number; question: string; answer: string; sectionTitle: string | null }[];
  };

  export let form: any;

  let editingHero = false;
  let editingSteps = false;
  let editingChoose = false;
  let editingFaqs = false;
  let editingCta = false;

  function cancel(section: string) {
    if (section === "hero") editingHero = false;
    if (section === "steps") editingSteps = false;
    if (section === "choose") editingChoose = false;
    if (section === "faqs") editingFaqs = false;
    if (section === "cta") editingCta = false;
  }

  let files: FileList | null = null;
  let fileName: string = "No file chosen";
  let previewSrc: string | null = null;

  $: {
    const file = files?.[0] ?? null;
    if (file) {
      fileName = file.name;
      const reader = new FileReader();
      reader.onload = () => (previewSrc = reader.result as string);
      reader.readAsDataURL(file);
    } else {
      fileName = "No file chosen";
      previewSrc = null;
    }
  }
</script>

<svelte:head>
  <title>Find Your Helper</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</svelte:head>

<section class="bg-white p-6 rounded-2xl shadow mb-6">
  <div class="flex items-center gap-4">
    <div class="p-2 bg-pink-100 rounded-xl">
      <Search class="w-6 h-6 text-pink-600" />
    </div>
    <div>
      <h1 class="text-2xl font-bold text-pink-300">Find Your Helper</h1>
      <p class="text-gray-600 text-sm">This page provides the steps on how clients can find their helpers.</p>
    </div>
  </div>
</section>

{#if form?.success}
  <div class="mb-4 p-3 bg-green-100 text-green-700 border border-green-300">
    {form.message}
  </div>
{/if}

<div class="space-y-10">
    <!-- HERO -->
  <section class="p-6 bg-white rounded-2xl shadow">
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
        <input type="hidden" name="id" value={data.hero?.id ?? 1} />

        <!-- Background -->
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

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">
            Save
          </button>
          <button
            type="button"
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl"
            on:click={() => cancel("hero")}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <p>
        <b>Background:</b>
        {#if data.hero?.bgImage}
          <img
            src={data.hero.bgImage}
            alt="Hero preview"
            class="h-20 object-cover inline rounded ml-2"
          />
        {/if}
      </p>
      <br>
      <p><b>Main Heading:</b> {data.hero?.mainHeading}</p>
      <p><b>Subheading:</b> {data.hero?.subheading}</p>
    {/if}
  </section>

  <!-- STEPS -->
  <section class="p-6 bg-white rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Steps</h2>
      {#if !editingSteps}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingSteps = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingSteps}
      <form method="post" action="?/updateSteps">
        {#each data.steps as step (step.id)}
          <input type="hidden" name="id" value={step.id} />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1">Step No</label>
          <input type="text" name="stepNo" value={step.stepNo} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1 mt-2">Icon</label>
          <input type="text" name="icon" value={step.icon} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1 mt-2">Title</label>
          <input type="text" name="title" value={step.title} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1 mt-2">Description</label>
          <textarea name="description" rows="2" class="w-full p-2 border rounded">{step.description}</textarea>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("steps")}>Cancel</button>
        </div>
      </form>
    {:else}
      <ul class="list-disc pl-6">
        {#each data.steps as step}
          <li>{step.stepNo}: {step.title} – {step.description}</li>
        {/each}
      </ul>
    {/if}
  </section>

  <!-- WHY CHOOSE US -->
  <section class="p-6 bg-white rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Why Choose Us</h2>
      {#if !editingChoose}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingChoose = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingChoose}
      <form method="post" action="?/updateChoose">
        {#each data.choose as item (item.id)}
          <input type="hidden" name="id" value={item.id} />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1">Icon</label>
          <input type="text" name="icon" value={item.icon} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1 mt-2">Reason</label>
          <input type="text" name="reason" value={item.reason} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1 mt-2">Description</label>
          <textarea name="description" rows="2" class="w-full p-2 border rounded">{item.description}</textarea>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("choose")}>Cancel</button>
        </div>
      </form>
    {:else}
      <ul class="list-disc pl-6">
        {#each data.choose as item}
          <li>{item.reason}: {item.description}</li>
        {/each}
      </ul>
    {/if}
  </section>

  <!-- FAQ -->
  <section class="p-6 bg-white rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">FAQs</h2>
      {#if !editingFaqs}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingFaqs = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingFaqs}
      <form method="post" action="?/updateFaqs">
        {#each data.faqs as faq (faq.id)}
          <input type="hidden" name="id" value={faq.id} />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1">Question</label>
          <input type="text" name="question" value={faq.question} class="w-full p-2 border rounded" />

          <!-- svelte-ignore a11y_label_has_associated_control -->
          <label class="block mb-1 mt-2">Answer</label>
          <textarea name="answer" rows="2" class="w-full p-2 border rounded">{faq.answer}</textarea>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("faqs")}>Cancel</button>
        </div>
      </form>
    {:else}
      <ul class="list-disc pl-6">
        {#each data.faqs as faq}
          <li><b>{faq.question}</b>: {faq.answer}</li>
        {/each}
      </ul>
    {/if}
  </section>

  <!-- CTA -->
  <section class="p-6 bg-white rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">CTA Banner</h2>
      {#if !editingCta}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingCta = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingCta}
      <form method="post" action="?/updateCta">
        <input type="hidden" name="id" value={data.cta?.id ?? 1} />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mb-2">Title</label>
        <input type="text" name="title" value={data.cta?.heading ?? ""} class="w-full p-2 border rounded" />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Description</label>
        <textarea name="description" rows="2" class="w-full p-2 border rounded">{data.cta?.subheading ?? ""}</textarea>

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Button Text</label>
        <input type="text" name="buttonText" value={data.cta?.buttonText ?? ""} class="w-full p-2 border rounded" />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Button Link</label>
        <input type="text" name="buttonLink" value={data.cta?.buttonLink ?? ""} class="w-full p-2 border rounded" />

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("cta")}>Cancel</button>
        </div>
      </form>
    {:else}
      {#if data.cta}
        <div class="space-y-2">
          <p><b>Title:</b> {data.cta.heading}</p>
          <p><b>Description:</b> {data.cta.subheading}</p>
          <p><b>Button Text:</b> {data.cta.buttonText}</p>
          <p><b>Button Link:</b> {data.cta.buttonLink}</p>
        </div>
      {:else}
        <p>No CTA data found in DB.</p>
      {/if}
    {/if}
  </section>
</div>
