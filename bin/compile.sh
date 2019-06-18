#!/usr/bin/env bash

indent() {
    sed -u 's/^/      /'
}

BUILD_DIR=$1
CACHE_DIR=$2
ENV_DIR=$3

echo "Creating temporary folder"
TMP_DIR=$(mktemp)

echo "Created temporary folder '${TMP_DIR}'" | indent

echo "Determining app folder value"
APP_DIR=$(cat ${ENV_DIR}/HMR_APP_DIR)
if [[ -z "${APP_DIR}" ]]; then
    echo "No app folder specified" | indent
    exit 1
fi

echo "Working with app folder: ${APP_DIR}" | indent

echo "Checking app folder existence" | indent
if [[ ! -d "${APP_DIR}" ]]; then
    echo "App folder does not exist" | indent
    exit 1
fi

echo "Copying app folder contents from '${BUILD_DIR}/${APP_DIR}' to '${TMP_DIR}'" | indent
cp -R ${BUILD_DIR}/${APP_DIR} ${TMP_DIR}
if ! [ $? ]; then
    echo "FAILED to copy a app folder contents" | indent
    exit 1
fi

echo "Removing root folder contents"
rm -rf ${BUILD_DIR}/*
if ! [ $? ]; then
    echo "FAILED to clear root folder contents" | indent
    exit 1
fi

echo "Moving back app folder contents to root folder"
mv -R ${TMP_DIR}/* ${BUILD_DIR}/
if ! [ $? ]; then
    echo "FAILED to move over app folder contents to root folder" | indent
    exit 1
fi

echo "Successfully copied over all app folder contents to root folder" | indent