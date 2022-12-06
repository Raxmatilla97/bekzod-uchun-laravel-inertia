        <template>
            <Head title="Postlar" />

            <AuthenticatedLayout>

                <template #header>
                    <h2 class="font-semibold text-xl text-gray-800 leading-tight">Telefon qilganlar</h2>
                </template>
                <div class="py-12">
                    <div class="max-w-12xl mx-auto sm:px-6 lg:px-12">
                        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">

                            <div class="mb-8 ml-2 mt-3">
                                <Link
                                    :href="route('post.create')"
                                    class="mx-auto mr-2 hover:bg-white hover:text-gray-500 border border-sky-500 block p-2 w-32 bg-sky-500 rounded-full
            text-center text-white">
                                    Post qo'shish
                                </Link>
                            </div>

                            <table v-if="posts" class="table-aut w-full text-center">
                                <thead>
                                <tr >
                                    <th>F.i.sh</th>
                                    <th>Qaysi yo'nalish</th>
                                    <th>Content</th>
                                    <th>Amaliyot</th>

                                </tr>
                                </thead>
                                <tbody >
                                <tr v-for="post in posts" class="mt-8 pt-8 border-t border-gray-300">
                                    <td>{{ post.id }}</td>
                                    <td>{{ post.title }}</td>
                                    <td>{{ post.content }}</td>
                                    <td>
                                        <div class="text-sm ">
                                            <Link :href="route('post.show', post.id)" class="text-sky-500">Ko'rish</Link>
                                        </div>
                                        <div class="text-sm ">
                                            <Link :href="route('post.edit', post.id)" class="text-sky-500">O'zgartirish</Link>
                                        </div>
                                        <div class="text-sm ">
                                            <p @click="deletePost(post.id)" class="cursor-pointer text-red-500">O'chirish</p>
                                        </div>

                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </AuthenticatedLayout>
        </template>

        <script setup>
        import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
        </script>
        <script>
        import { Head, Link } from '@inertiajs/inertia-vue3'


        export default {
            name: "index",

            props: [
                'posts'
            ],
            components: {
                Head,
                Link

            },
            methods: {
                deletePost(id) {
                this.$inertia.delete(`/posts/${id}`)
                }
            }

        }
        </script>



