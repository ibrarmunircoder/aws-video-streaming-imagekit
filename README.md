## 🎬 🎥 🔴 AWS Video Streaming app with Imagekit

Streaming S3 videos using Imagekit as an optimization and caching layer.

---

### Live Demo:

React App Demo to display imagekit videos stored in s3

![react app](./images/ract-app.png)

Imagekit also supports some transformations (resize, trim, overlay) only fly without having to store multiple files.

**Resize demo**

![resize](./images/resize.png)

**Trim demo** (original 14 seconds => 5 seconds)

![trim](./images/trim.png)

**Adaptive bitrate** (Imagekit will display video of different resolutions based on player and network speed)

![adaptive bitrate](./images/adaptive-bitrate.png)

Connecting Imagekit with S3 by setting up an origin in imagekit

![S3 origin](./images/s3-origin.png)

---

### 📌 Project Overview::

This project demonstrates how to stream videos stored in Amazon S3 using ImageKit as a CDN and optimization layer.

ImageKit supports multiple external storage origins, with S3 being one of them. After configuring S3 as an origin, ImageKit:

- Securely fetches videos using IAM credentials

- Applies on-the-fly transformations

- Caches content at edge locations

- Serves optimized media globally via CDN

This eliminates the need to store multiple processed versions of the same video while improving performance and scalability.

---

### 🏗️ Architecture Diagram:

![Architecture Diagram](./images/diagram.png)

### 🚀 Key Features:

- Imagekit integration with S3 as an external origin
- Video streaming via ImageKit with S3 origin
- On-the-fly video transformations (resize, trim, etc.)
- Secure ImageKit–S3 integration using IAM credentials
- AWS Infrastructure provisioning using Terraform
- Built a React frontend to consume optimized video URLs

---

### 🎯 Learning Objectives

- Understand how to configure **Amazon S3 as an external origin** in ImageKit
- Learn how to securely connect third-party services using **IAM credentials**
- Implement **video streaming through a CDN layer**
- Apply **on-the-fly video transformations** (resize, trim, etc.)
- Understand how **adaptive bitrate streaming** improves user experience
