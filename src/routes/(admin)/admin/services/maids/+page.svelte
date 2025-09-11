<script lang="ts">
  import { Users } from "lucide-svelte";
  export let icon = Users;

  export let data: {
    hero: { id: number; bgImage: string; mainHeading: string; subheading: string };
    reasons: { id: number; category: string; category_desc: string; title: string; description: string; icon: string }[];
    galleries: { id: number; title?: string; description: string }[];
    galleryImages: { id: number; imageUrl: string; alt: string }[];
    steps: { id: number; sectiontitle?: string; stepNumber?: string; title?: string; description?: string }[];
    faqs: { id: number; sectiontitle?: string; question?: string; answer?: string }[];
  };

  export let form;

  let draft = structuredClone(data);

  let editingHero = false;
  let editingReasons = false;
  let editingGalleries = false;
  let editingGalleryImages = false;
  let editingSteps = false;
  let editingFaqs = false;

  type SectionKey = "hero" | "reasons" | "galleries" | "galleryImages" | "steps" | "faqs";

  function cancel(section: SectionKey) {
    if (section === "hero") draft.hero = structuredClone(data.hero);
    if (section === "reasons") draft.reasons = structuredClone(data.reasons);
    if (section === "galleries") draft.galleries = structuredClone(data.galleries);
    if (section === "galleryImages") draft.galleryImages = structuredClone(data.galleryImages);
    if (section === "steps") draft.steps = structuredClone(data.steps);
    if (section === "faqs") draft.faqs = structuredClone(data.faqs);

    if (section === "hero") editingHero = false;
    if (section === "reasons") editingReasons = false;
    if (section === "galleries") editingGalleries = false;
    if (section === "galleryImages") editingGalleryImages = false;
    if (section === "steps") editingSteps = false;
    if (section === "faqs") editingFaqs = false;
  }

  // Group reasons by category for display
  $: groupedReasons = data.reasons.reduce((acc, r) => {
    const categoryKey = r.category?.trim() || "Uncategorized";
    if (!acc[categoryKey]) acc[categoryKey] = [];
    acc[categoryKey].push(r);
    return acc;
  }, {} as Record<string, typeof data.reasons>);
</script>

<svelte:head>
  <title>Services: Maids</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</svelte:head>

{#if form?.success}
  <div class="p-3 mb-4 rounded bg-green-100 text-green-700">{form.message}</div>
{:else if form?.error}
  <div class="p-3 mb-4 rounded bg-red-100 text-red-700">{form.error}</div>
{/if}

<section class="bg-white p-6 rounded-2xl shadow mb-6 flex items-center gap-4">
  <div class="p-2 bg-pink-100 rounded-xl">
    <svelte:component this={icon} class="w-6 h-6 text-pink-600" />
  </div>
  <div>
    <h1 class="text-2xl font-bold text-pink-300">Maids</h1>
    <p class="text-gray-600 text-sm">
      Information about maid nationalities, experience levels, a photo gallery, and application steps.
    </p>
  </div>
</section>

<div class="space-y-10">

  <!-- HERO -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Hero Section</h2>
      {#if !editingHero}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => editingHero = true}>✏️ Edit</button>
      {/if}
    </div>
    {#if editingHero}
      <form method="post">
        <input type="hidden" name="id" value={draft.hero.id} />
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mb-2">Background Image URL</label>
        <input type="text" name="bgImage" bind:value={draft.hero.bgImage} class="w-full p-2 border rounded" />
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Main Heading</label>
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <input type="text" name="mainHeading" bind:value={draft.hero.mainHeading} class="w-full p-2 border rounded" />
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Subheading</label>
        <textarea rows="2" name="subheading" bind:value={draft.hero.subheading} class="w-full p-2 border rounded"></textarea>
        <div class="flex gap-3 mt-6">
          <button type="submit" formaction="?/updateHero" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("hero")}>Cancel</button>
        </div>
      </form>
    {:else}
      <p><b>Background:</b> {data.hero.bgImage}</p>
      <p><b>Main Heading:</b> {data.hero.mainHeading}</p>
      <p><b>Subheading:</b> {data.hero.subheading}</p>
    {/if}
  </section>

  <!-- REASONS -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Why Work Here / With Us</h2>
      {#if !editingReasons}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => editingReasons = true}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingReasons}
      <form method="post">
        <input type="hidden" name="count" value={draft.reasons.length} />
        {#each draft.reasons as r, i}
          <input type="hidden" name={`id_${i}`} value={r.id} />
          <div class="mb-4 border-b pb-4">
            {#if i === 0 || draft.reasons[i].category !== draft.reasons[i-1].category}
              <!-- svelte-ignore a11y_label_has_associated_control -->
              <label class="block mb-1">Category</label>
              <input type="text" name={`category_${i}`} bind:value={r.category} class="w-full p-2 border rounded mb-2" />
              <!-- svelte-ignore a11y_label_has_associated_control -->
              <label class="block mb-1">Category Description</label>
              <input type="text" name={`category_${i}`} bind:value={r.category_desc} class="w-full p-2 border rounded mb-2" />
            {:else}
              <!-- hidden field so category is still submitted -->
              <input type="hidden" name={`category_${i}`} value={r.category} />
              <input type="hidden" name={`category_desc_${i}`} value={r.category_desc} />
            {/if}
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-1">Title</label>
            <input type="text" name={`title_${i}`} bind:value={r.title} class="w-full p-2 border rounded mb-1" />
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-1">Description</label>
            <textarea rows="2" name={`description_${i}`} bind:value={r.description} class="w-full p-2 border rounded"></textarea>
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-1">Icon (optional)</label>
            <input type="text" name={`icon_${i}`} bind:value={r.icon} class="w-full p-2 border rounded" />
          </div>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" formaction="?/updateReasons" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("reasons")}>Cancel</button>
        </div>
      </form>
    {:else}
      {#each Object.entries(groupedReasons) as [category, items]}
        <div class="mb-6">
          <h3 class="font-semibold text-pink-600">{category}</h3>
          {#if items[0].category_desc}
            <p class="text-gray-700 mb-2">{items[0].category_desc}</p>
          {/if}
          <ul class="list-disc ml-5 space-y-1">
            {#each items as r}
              {#if r.description && r.description.trim() !== ""}
                <li><b>{r.title}</b>: {r.description}</li>
              {/if}
            {/each}
          </ul>
        </div>
      {/each}
    {/if}
  </section>

  <!-- GALLERIES -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Gallery (Text)</h2>
      {#if !editingGalleries}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => editingGalleries = true}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingGalleries}
      <form method="post" action="?/updateGalleries">
        <input type="hidden" name="count" value={draft.galleries.length} />
        {#each draft.galleries as g, i}
          <input type="hidden" name={`id_${i}`} value={g.id} />
          <div class="mb-4 border-b pb-4">
            {#if g.title !== undefined}
              <!-- svelte-ignore a11y_label_has_associated_control -->
              <label class="block mb-1">Title</label>
              <input type="text" name={`title_${i}`} bind:value={g.title} class="w-full p-2 border rounded" />
            {/if}
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Description</label>
            <textarea rows="2" name={`description_${i}`} bind:value={g.description} class="w-full p-2 border rounded"></textarea>
          </div>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("galleries")}>Cancel</button>
        </div>
      </form>
    {:else}
      {#each data.galleries as g, i}
        <p><b>{g.title ?? "Description"}:</b> {g.description}</p>
      {/each}
    {/if}
  </section>

  <!-- GALLERY IMAGES -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Gallery Images</h2>
      {#if !editingGalleryImages}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => editingGalleryImages = true}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingGalleryImages}
      <form method="post" action="?/updateGalleryImages">
        <input type="hidden" name="count" value={draft.galleryImages.length} />
        {#each draft.galleryImages as img, i}
          <input type="hidden" name={`id_${i}`} value={img.id} />
          <div class="mb-4 border-b pb-4">
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-1">Image URL</label>
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <input type="text" name={`imageUrl_${i}`} bind:value={img.imageUrl} class="w-full p-2 border rounded" />
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Alt Text</label>
            <input type="text" name={`alt_${i}`} bind:value={img.alt} class="w-full p-2 border rounded" />
          </div>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("galleryImages")}>Cancel</button>
        </div>
      </form>
    {:else}
      <ul class="list-disc ml-5">
        {#each data.galleryImages as img, i}
          <li><b>Image {i+1}:</b> {img.imageUrl} ({img.alt})</li>
        {/each}
      </ul>
    {/if}
  </section>

  <!-- STEPS -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Steps to Apply</h2>
      {#if !editingSteps}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => editingSteps = true}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingSteps}
      <form method="post" action="?/updateSteps">
        <input type="hidden" name="count" value={draft.steps.length} />
        {#each draft.steps as s, i}
          <input type="hidden" name={`id_${i}`} value={s.id} />
          {#if i === 0}
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-2">Section Title</label>
            <input type="text" name="sectiontitle" bind:value={s.sectiontitle} class="w-full p-2 border rounded mb-2" />
          {/if}
          <div class="mb-4 border-b pb-4">
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-1">Step Number</label>
            <input type="text" name={`stepNumber_${i}`} bind:value={s.stepNumber} class="w-full p-2 border rounded" />
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Title</label>
            <input type="text" name={`title_${i}`} bind:value={s.title} class="w-full p-2 border rounded" />
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Description</label>
            <textarea rows="2" name={`description_${i}`} bind:value={s.description} class="w-full p-2 border rounded"></textarea>
          </div>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("steps")}>Cancel</button>
        </div>
      </form>
    {:else}
      <h3 class="font-semibold text-gray-800 mb-2">{data.steps[0].sectiontitle}</h3>
      <ol class="list-decimal ml-5 text-gray-700 space-y-1">
        {#each data.steps as s, i}
          <li><b>{s.stepNumber} </b>: <b>{s.title}</b>: {s.description}</li>
        {/each}
      </ol>
    {/if}
  </section>

  <!-- FAQ -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">FAQ</h2>
      {#if !editingFaqs}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => editingFaqs = true}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingFaqs}
      <form method="post" action="?/updateFaqs">
        <input type="hidden" name="count" value={draft.faqs.length} />
        {#each draft.faqs as f, i}
          <input type="hidden" name={`id_${i}`} value={f.id} />
          {#if i === 0}
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-2">Section Title</label>
            <input type="text" name="sectiontitle" bind:value={f.sectiontitle} class="w-full p-2 border rounded mb-2" />
          {/if}
          <div class="mb-4 border-b pb-4">
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mb-1">Question</label>
            <input type="text" name={`question_${i}`} bind:value={f.question} class="w-full p-2 border rounded" />
            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block mt-2 mb-1">Answer</label>
            <textarea rows="2" name={`answer_${i}`} bind:value={f.answer} class="w-full p-2 border rounded"></textarea>
          </div>
        {/each}

        <div class="flex gap-3 mt-6">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => cancel("faqs")}>Cancel</button>
        </div>
      </form>
    {:else}
      <h3 class="font-semibold text-gray-800 mb-2">{data.faqs[0].sectiontitle}</h3>
      <ul class="list-disc ml-5 text-gray-700 space-y-1">
        {#each data.faqs as f}
          <li><b>{f.question}</b>: {f.answer}</li>
        {/each}
      </ul>
    {/if}
  </section>
</div>
