#!/bin/bash

# Exit on error
set -e

# unshallow since GitHub actions does a shallow clone
git fetch --unshallow
git fetch origin

# Get all the modules that were changed
while read line; do
  module_name=${line%%/*}
  if [[ ${MODULES} != *"${module_name}"* ]]; then
    MODULES="${MODULES} ${module_name}"
  fi
done < <(git diff --name-only origin/$GITHUB_BASE_REF)
changed_modules=$MODULES

# Get a list of all available gradle tasks
AVAILABLE_TASKS=$(./gradlew tasks --all)

# Check if these modules have gradle tasks
build_commands=""
for module in $changed_modules
do
  if [[ $AVAILABLE_TASKS =~ $module":app:" ]]; then
    build_commands=${build_commands}" :"${module}":app:assembleDebug :"${module}":app:check"
  fi
done

# Build
echo "Building Pull Request with"
echo $build_commands
eval "./gradlew clean ktlint ${build_commands}"
<script type="module">
  // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/10.4.0/firebase-app.js";
      import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.4.0/firebase-analytics.js";
        // TODO: Add SDKs for Firebase products that you want to use
          // https://firebase.google.com/docs/web/setup#available-libraries

            // Your web app's Firebase configuration
              // For Firebase JS SDK v7.20.0 and later, measurementId is optional
                const firebaseConfig = {
                    apiKey: "AIzaSyAJfQYzNYwlgy0yZcgGQ4Ijtz5YoJk-mfo",
                        authDomain: "my-project-15313079621-kik.firebaseapp.com",
                            projectId: "my-project-15313079621-kik",
                                storageBucket: "my-project-15313079621-kik.appspot.com",
                                    messagingSenderId: "130314877043",
                                        appId: "1:130314877043:web:1f337039e7f61d27d55206",
                                            measurementId: "G-4F32ZWYDCP"
                                              };

                                                // Initialize Firebase
                                                  const app = initializeApp(firebaseConfig);
                                                    const analytics = getAnalytics(app);
                                                    </script>