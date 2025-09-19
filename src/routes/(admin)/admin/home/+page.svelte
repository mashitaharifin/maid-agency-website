<script lang="ts">
  import { Home } from "lucide-svelte";

  // typed shape of incoming data (helpful for TS)
  interface Hero {
    id: number;
    mainHeading: string;
    subheading: string;
    bgImage: string;
  }
  interface Welcome {
    id: number;
    description: string;
  }
  interface Recognition {
    id: number;
    sectionTitle: string;
    caption: string;
    urlImage: string;
  }
  interface Service {
    id: number;
    title: string;
    maidType: string;
    description: string;
  }
  interface Review {
    id: number;
    title: string;
    reviewText: string;
    reviewerName: string;
  }

  export let data: {
    hero?: Hero | null;
    welcome?: Welcome | null;
    recognitions?: Recognition | null;
    services?: Service[] | null;
    reviews?: Review[] | null;
  };

  // action response from the server (success messages, etc.)
  export let form: any;

  let icon = Home;

  // Track editing states per section
  let editingHero = false;
  let editingWelcome = false;
  let editingRecognitions = false;
  let editingServices: number | null = null; // id of service being edited
  let editingReviews: number | null = null;  // id of review being edited

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

  let recogFile: File | null = null;
  let recogFileName: string = "No file chosen";
  let recogPreview: string | null = data.recognitions?.urlImage ?? null;

  function handleRecogFileChange(event: Event) {
    const input = event.target as HTMLInputElement;
    const file = input.files?.[0] ?? null;
    recogFile = file;

    if (file) {
      recogFileName = file.name;
      const reader = new FileReader();
      reader.onload = () => {
        recogPreview = reader.result as string;
      };
      reader.readAsDataURL(file);
    } else {
      recogFileName = "No file chosen";
      recogPreview = null;
    }
  }
</script>

<svelte:head>
  <title>Home</title>
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
    rel="stylesheet"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
  />
</svelte:head>

<section class="bg-white p-6 rounded-2xl shadow mb-6">
  <div class="flex items-center gap-4">
    <div class="p-2 bg-pink-100 rounded-xl">
      <svelte:component this={icon} class="w-6 h-6 text-pink-600" />
    </div>
    <div>
      <h1 class="text-2xl font-bold text-pink-300">Home</h1>
      <p class="text-gray-600 text-sm">This is the page when client browse to homepage.</p>
    </div>
  </div>
</section>

{#if form?.success}
  <div class="mb-4 p-3 rounded bg-green-100 text-green-700 border border-green-300">
    {form.success}
  </div>
{/if}

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

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Background Image</label>

        {#if data.hero?.bgImage}
          <img
            src={data.hero.bgImage}
            alt="Current hero background"
            class="h-32 object-cover rounded mb-2"
          />
        {/if}

        <!-- File input (hidden) -->
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
        <span class="ml-2 text-gray-600 italic">{fileName}</span>

        {#if previewSrc}
          <img src={previewSrc} alt="Preview" class="h-32 object-cover rounded mt-2" />
        {/if}

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

  <!-- ABOUT US SECTION -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">About Us</h2>
      {#if !editingWelcome}
        <button class="text-sm text-gray-600 hover:text-pink-600" on:click={() => (editingWelcome = true)}>✏️ Edit</button>
      {/if}
    </div>

    {#if editingWelcome}
      <form method="post" action="?/updateWelcome">
        <input type="hidden" name="id" value={data.welcome?.id ?? ""} />
        <textarea name="description" rows="4" class="w-full p-2 border rounded">{data.welcome?.description ?? ""}</textarea>

        <div class="flex gap-3 mt-4">
          <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
          <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => (editingWelcome = false)}>
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <p>{data.welcome?.description ?? "—"}</p>
    {/if}
  </section>

  <!-- RECOGNITIONS SECTION -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Recognitions</h2>
      {#if !editingRecognitions}
        <button
          class="text-sm text-gray-600 hover:text-pink-600"
          on:click={() => (editingRecognitions = true)}
        >
          ✏️ Edit
        </button>
      {/if}
    </div>

    {#if editingRecognitions}
      <form method="post" action="?/updateRecognitions" enctype="multipart/form-data" class="space-y-4">
        <input type="hidden" name="id" value={data.recognitions?.id ?? ""} />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Section Title</label>
        <input
          type="text"
          name="sectionTitle"
          value={data.recognitions?.sectionTitle ?? ""}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Caption</label>
        <input
          type="text"
          name="caption"
          value={data.recognitions?.caption ?? ""}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Upload Image</label>
        <label
          for="urlImage"
          class="inline-block cursor-pointer px-4 py-2 bg-pink-400 text-white rounded-xl hover:bg-pink-600 transition"
        >
          Choose File
        </label>
        <input
          id="urlImage"
          type="file"
          name="urlImage"
          accept="image/*"
          class="hidden"
          on:change={handleRecogFileChange}
        />
        <span class="ml-2 text-gray-600 italic">{recogFileName}</span>

        {#if recogPreview}
          <img src={recogPreview} alt="Preview" class="w-40 mt-2 rounded shadow" />
        {/if}

        <div class="flex gap-3 mt-4">
          <button
            type="submit"
            class="px-5 py-2.5 bg-pink-600 text-white rounded-xl"
          >
            Save
          </button>
          <button
            type="button"
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl"
            on:click={() => (editingRecognitions = false)}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <p><b>{data.recognitions?.sectionTitle ?? "—"}</b></p>
      <p>{data.recognitions?.caption ?? "—"}</p>
      {#if data.recognitions?.urlImage}
        <img
          src={data.recognitions.urlImage}
          alt="Certificate"
          class="w-40 mt-2 rounded shadow"
        />
      {/if}
    {/if}
  </section>

  <!-- SERVICES SECTION -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <h2 class="text-xl font-bold text-pink-600 mb-4">Services</h2>

    {#each data.services ?? [] as service (service.id)}
      <div class="border border-gray-400 rounded-xl p-4 mb-4">
        {#if editingServices === service.id}
          <form method="post" action="?/updateService" class="space-y-2">
            <input type="hidden" name="id" value={service.id} />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block">Title</label>
            <input type="text" name="title" value={service.title ?? ""} class="w-full p-2 border rounded" />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block">Maid Type</label>
            <input type="text" name="maidType" value={service.maidType ?? ""} class="w-full p-2 border rounded" />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block">Description</label>
            <textarea name="description" rows="2" class="w-full p-2 border rounded">{service.description ?? ""}</textarea>

            <div class="flex gap-3 mt-4">
              <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
              <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => (editingServices = null)}>
                Cancel
              </button>
            </div>
          </form>
        {:else}
          <p><b>{service.maidType ?? "—"}</b>: {service.description ?? "—"}</p>
          <button class="text-sm text-gray-600 hover:text-pink-600 mt-2" on:click={() => (editingServices = service.id)}>✏️ Edit</button>
        {/if}
      </div>
    {/each}
  </section>

  <!-- REVIEWS SECTION -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <h2 class="text-xl font-bold text-pink-600 mb-4">Reviews</h2>

    {#each data.reviews ?? [] as review (review.id)}
      <div class="border border-gray-400 rounded-xl p-4 mb-4">
        {#if editingReviews === review.id}
          <form method="post" action="?/updateReview" class="space-y-2">
            <input type="hidden" name="id" value={review.id} />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block">Title</label>
            <input type="text" name="title" value={review.title ?? ""} class="w-full p-2 border rounded" />

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block">Review Text</label>
            <textarea name="reviewText" rows="2" class="w-full p-2 border rounded">{review.reviewText ?? ""}</textarea>

            <!-- svelte-ignore a11y_label_has_associated_control -->
            <label class="block">Reviewer Name</label>
            <input type="text" name="reviewerName" value={review.reviewerName ?? ""} class="w-full p-2 border rounded" />

            <div class="flex gap-3 mt-4">
              <button type="submit" class="px-5 py-2.5 bg-pink-600 text-white rounded-xl">Save</button>
              <button type="button" class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl" on:click={() => (editingReviews = null)}>
                Cancel
              </button>
            </div>
          </form>
        {:else}
          <p><i>"{review.reviewText ?? ""}"</i> – <b>{review.reviewerName ?? ""}</b></p>
          <button class="text-sm text-gray-600 hover:text-pink-600 mt-2" on:click={() => (editingReviews = review.id)}>✏️ Edit</button>
        {/if}
      </div>
    {/each}
  </section>
</div>
