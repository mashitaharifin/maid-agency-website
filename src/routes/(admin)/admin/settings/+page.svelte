<script lang="ts">
  import { Settings } from "lucide-svelte";

  // Data from +page.server.ts
  export let data: {
    settings: {
      id: number;
      logoUrl: string | null;
      agencyName: string | null;
      whatsappLink: string | null;
      facebookLink: string | null;
      phone: string | null;
      licenseNo: string | null;
      companyNo: string | null;
      empRegNo: string | null;
      copyright: string | null;
    }
  };

  // Action return values
  export let form;

  let editingNavbar = false;
  let editingFooter = false;

  let draft = structuredClone(data.settings);

  function cancel(section: string) {
    draft = structuredClone(data.settings);
    if (section === "navbar") editingNavbar = false;
    if (section === "footer") editingFooter = false;
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
  <title>Settings</title>
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
      <Settings class="w-6 h-6 text-pink-600" />
    </div>
    <div>
      <h1 class="text-2xl font-bold text-pink-300">Settings</h1>
      <p class="text-gray-600 text-sm">
        This page provides the details of global contents.
      </p>
    </div>
  </div>
</section>

<div class="space-y-10">
  <!-- NAVBAR SETTINGS -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Navbar Settings</h2>
      {#if !editingNavbar}
        <button
          class="text-sm text-gray-600 hover:text-pink-600"
          on:click={() => (editingNavbar = true)}
        >
          ✏️ Edit
        </button>
      {/if}
    </div>

    {#if editingNavbar}
      <form method="post" action="?/updateNavbar" enctype="multipart/form-data" class="space-y-4">
        <input type="hidden" name="id" value={data.settings.id} />

        <!-- Logo -->
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block">Logo</label>
        {#if data.settings.logoUrl}
          <img
            src={data.settings.logoUrl}
            alt="Current Logo"
            class="h-16 object-contain rounded mb-2"
          />
        {/if}

        <input
          id="logoUrl"
          type="file"
          name="logoUrl"
          accept="image/*"
          class="hidden"
          bind:files={files}
        />

        <label
          for="logoUrl"
          class="inline-block cursor-pointer px-4 py-2 bg-pink-400 text-white rounded-2xl hover:bg-pink-600 transition"
        >
          Choose File
        </label>
        <span class="ml-2 text-gray-600 italic">{fileName}</span>

        {#if previewSrc}
          <img src={previewSrc} alt="Logo Preview" class="h-16 object-contain rounded mt-2" />
        {/if}

        <!-- Agency Name -->
        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Agency Name</label>
        <input
          type="text"
          name="agencyName"
          value={data.settings.agencyName}
          class="w-full p-2 border rounded"
        />

        <div class="flex gap-3 mt-6">
          <button
            type="submit"
            class="px-5 py-2.5 bg-pink-600 text-white rounded-xl"
          >
            Save
          </button>
          <button
            type="button"
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl"
            on:click={() => cancel("navbar")}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <p>
        <b>Logo:</b>
        {#if data.settings.logoUrl}
          <img
            src={data.settings.logoUrl}
            alt="Logo Preview"
            class="h-10 inline ml-2 object-contain"
          />
        {/if}
      </p>
      <p><b>Agency Name:</b> {data.settings.agencyName}</p>
    {/if}
  </section>

  <!-- FOOTER SETTINGS -->
  <section class="bg-white p-6 rounded-2xl shadow">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-xl font-bold text-pink-600">Footer Settings</h2>
      {#if !editingFooter}
        <button
          class="text-sm text-gray-600 hover:text-pink-600"
          on:click={() => (editingFooter = true)}
          >✏️ Edit</button
        >
      {/if}
    </div>

    {#if editingFooter}
      <form method="post">
        <input type="hidden" name="id" value={data.settings.id} />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mb-2">WhatsApp Link</label>
        <input
          type="text"
          name="whatsappLink"
          bind:value={draft.whatsappLink}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Facebook Link</label>
        <input
          type="text"
          name="facebookLink"
          bind:value={draft.facebookLink}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Phone</label>
        <input
          type="text"
          name="phone"
          bind:value={draft.phone}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">License No</label>
        <input
          type="text"
          name="licenseNo"
          bind:value={draft.licenseNo}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Company Registration No</label>
        <input
          type="text"
          name="companyNo"
          bind:value={draft.companyNo}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Employment Agency Reg No</label>
        <input
          type="text"
          name="empRegNo"
          bind:value={draft.empRegNo}
          class="w-full p-2 border rounded"
        />

        <!-- svelte-ignore a11y_label_has_associated_control -->
        <label class="block mt-4 mb-2">Copyright</label>
        <input
          type="text"
          name="copyright"
          bind:value={draft.copyright}
          class="w-full p-2 border rounded"
        />

        <div class="flex gap-3 mt-6">
          <button
            type="submit"
            formaction="?/updateFooter"
            class="px-5 py-2.5 bg-pink-600 text-white rounded-xl"
          >
            Save
          </button>
          <button
            type="button"
            class="px-5 py-2.5 bg-gray-200 text-gray-700 rounded-xl"
            on:click={() => cancel("footer")}
          >
            Cancel
          </button>
        </div>
      </form>
    {:else}
      <p><b>WhatsApp:</b> {data.settings.whatsappLink}</p>
      <p><b>Facebook:</b> {data.settings.facebookLink}</p>
      <p><b>Phone:</b> {data.settings.phone}</p>
      <p><b>License No:</b> {data.settings.licenseNo}</p>
      <p><b>Company No:</b> {data.settings.companyNo}</p>
      <p><b>Employment Reg No:</b> {data.settings.empRegNo}</p>
      <p><b>Copyright:</b> {data.settings.copyright}</p>
    {/if}
  </section>
</div>
