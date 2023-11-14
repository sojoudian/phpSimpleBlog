-- MySQL dump 10.13  Distrib 8.1.0, for macos13.3 (arm64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (6,'Rust','Rust is a multi-paradigm, general-purpose programming language that emphasizes performance, type safety, and concurrency. It enforces memory safety, meaning that all references point to valid memory, without requiring the use of automated memory management techniques such as garbage collection. To simultaneously enforce memory safety and prevent data races, its &amp;quot;borrow checker&amp;quot; tracks the object lifetime of all references in a program during compilation. Rust was influenced by ideas from functional programming, including immutability, higher-order functions, and algebraic data types. It is popular for systems programming.\r\n\r\nSoftware developer Graydon Hoare created Rust as a personal project while working at Mozilla Research in 2006. Mozilla officially sponsored the project in 2009. In the years following the first stable release in May 2015, Rust was adopted by companies including Amazon, Discord, Dropbox, Facebook (Meta), Google (Alphabet), and Microsoft. In December 2022, it became the first language other than C and assembly to be supported in the development of the Linux kernel.\r\n\r\nRust has been noted for its rapid adoption, and has been studied in programming language theory research.','Maz','2023-11-14 06:07:06'),(7,'Python','Python is a high-level, general-purpose programming language known for its emphasis on code readability, primarily through significant indentation. It&amp;#039;s dynamically typed, garbage-collected, and supports multiple programming paradigms, including structured, procedural, object-oriented, and functional programming. Python is often described as a &amp;quot;batteries included&amp;quot; language because of its comprehensive standard library.\r\n\r\nThe language was created in the late 1980s by Guido van Rossum as a successor to the ABC programming language. The first release of Python, version 0.9.0, was in 1991. Significant later versions include Python 2.0 in 2000 and Python 3.0 in 2008, which was not backward-compatible with earlier versions. Python 2.7.18, released in 2020, was the last release of Python 2.\r\n\r\nPython consistently ranks as one of the most popular programming languages. It was conceived by van Rossum at Centrum Wiskunde &amp;amp; Informatica (CWI) in the Netherlands. Van Rossum led the project until July 2018, when he stepped down, and a five-member Steering Council took over the leadership in January 2019','Maz','2023-11-14 06:07:40'),(8,'Go Programming Language','Go, often referred to as Golang due to its former domain name, is a statically typed, compiled high-level programming language developed at Google by Robert Griesemer, Rob Pike, and Ken Thompson. Introduced in 2007 and announced publicly in 2009, Go was designed to enhance programming productivity in modern computing environments with multicore processors, networked systems, and large codebases. It features a syntax similar to C, but incorporates memory safety, garbage collection, structural typing, and CSP-style concurrency. Go aims to balance static typing and runtime efficiency with readability and usability, drawing elements from Python and C to improve high-performance networking and multiprocessing​​​​.\r\n\r\nGo includes two major implementations: Google&#039;s &quot;gc&quot; compiler toolchain, targeting multiple operating systems and WebAssembly, and gofrontend, which is a frontend to other compilers used with the libgo library. Additionally, GopherJS, a third-party source-to-source compiler, enables Go to be compiled to JavaScript for front-end web development​​.\r\n\r\nThe language design emphasizes simplicity and safety, featuring a syntax and environment similar to dynamic languages with concise variable declaration and initialization, fast compilation, and remote package management. Go has distinctive approaches to concurrency, using lightweight processes (goroutines), channels, and the select statement. It also employs an interface system instead of virtual inheritance, producing statically linked native binaries by default, and aims to keep its language specification simple enough to be easily understood by programmers, partly by omitting features common in similar languages​','Maz','2023-11-14 06:13:50'),(9,'Go','Go, also known as Golang, is a statically typed, compiled programming language designed at Google by Robert Griesemer, Rob Pike, and Ken Thompson. Launched in 2009, it was created to improve programming productivity in an era of multicore, networked machines, and large codebases. Go emphasizes simplicity and efficiency, featuring a syntax similar to C but with memory safety, garbage collection, structural typing, and CSP-style concurrency.\r\n\r\nThe language has a minimalistic design, focusing on ease of use and high performance. It supports concurrent programming, allowing multiple processes to run simultaneously and efficiently. Go&#039;s toolchain includes a suite of tools designed to foster a productive environment for developers.\r\n\r\nGo is particularly known for its effective use in cloud computing, microservices, and other distributed systems due to its efficient memory and concurrent processing capabilities. Its growing popularity is evident in various large-scale projects, particularly in the tech industry, making it a favored choice for modern backend development.','Maz','2023-11-14 06:21:14'),(12,'Kubernetes','Kubernetes is an open-source platform designed to automate deploying, scaling, and operating application containers. It was developed by Google and released in 2015. Influenced by Google&#039;s Borg cluster manager, Kubernetes differs in that its source code is written in Go. It&#039;s part of the Cloud Native Computing Foundation (CNCF) and integrates with various technologies like Helm, a package manager for Kubernetes.\r\n\r\nThe platform defines a set of primitives for deploying, maintaining, and scaling applications based on CPU, memory, or custom metrics. Kubernetes is extensible and loosely coupled, meaning it can be adapted to suit different workload requirements. Its architecture is based on a primary/replica model, dividing components into those managing individual nodes and those part of the control plane.\r\n\r\nThe Kubernetes API server is a key component, serving the Kubernetes API using JSON over HTTP. It processes REST requests, updates the state of API objects in etcd, and enables clients to configure workloads and containers across worker nodes. The API server employs etcd&#039;s watch API to monitor the cluster and maintain its desired state','Maz','2023-11-14 06:48:28'),(13,'Docker','Docker is a Platform as a Service (PaaS) product that utilizes OS-level virtualization to deliver software in containers. Launched in 2013 by Docker, Inc., Docker is designed for both free and premium users. Its core component, Docker Engine, hosts these containers. Docker&#039;s approach allows for the efficient deployment of applications in various environments, maintaining their functionality in isolated settings.\r\n\r\nContainers in Docker are isolated from each other, each bundling its own software, libraries, and configuration files. They communicate through well-defined channels and, by sharing the services of a single operating system kernel, are more resource-efficient compared to virtual machines.\r\n\r\nDocker packages applications and their dependencies in virtual containers, enabling them to run on Linux, Windows, or macOS systems. This flexibility allows applications to operate in diverse environments like on-premises, public, private clouds, or decentralized computing setups. On Linux, Docker utilizes the Linux kernel&#039;s resource isolation features, such as cgroups and namespaces, along with a union-capable file system like OverlayFS, to run containers efficiently within a single Linux instance​','Maz','2023-11-14 06:49:54'),(14,'Git','Git is a distributed version control system primarily used for tracking changes in computer files and coordinating work among programmers. Originated by Linus Torvalds in 2005 for Linux kernel development, Git is distinctive for allowing every directory on every computer to act as a full-fledged repository with complete history and version-tracking abilities, independent of network access or a central server. It is open-source, under the GPL-2.0-only license.\r\n\r\nThe development of Git started in 2005 following issues with the BitKeeper SCM system used for Linux development. Torvalds aimed for a distributed system like BitKeeper but with greater speed and strong safeguards against corruption. His criteria for Git’s design included opposing the Concurrent Versions System (CVS) approach, supporting a BitKeeper-like workflow, and preventing corruption.\r\n\r\nGit&#039;s development began in April 2005 and quickly progressed, with the first merge of multiple branches occurring later that month. By June 2005, Git was managing the Linux kernel 2.6.12 release. It has since become the most popular distributed version control system, with a vast majority of developers using it as their primary version control system by 2022','Maz','2023-11-14 06:56:29'),(17,'Ruby','Ruby is a high-level, general-purpose programming language known for its emphasis on programming productivity and simplicity. Created in the mid-1990s by Yukihiro &amp;quot;Matz&amp;quot; Matsumoto in Japan, Ruby stands out as an interpreted language where everything, including primitive data types, is treated as an object. This object-oriented approach is central to its design philosophy. Ruby is dynamically typed and incorporates features like garbage collection and just-in-time compilation. It supports various programming paradigms, including procedural, object-oriented, and functional programming, and was influenced by languages such as Perl, Smalltalk, Eiffel, Ada, BASIC, Java, and Lisp​​.\r\n\r\nThe concept of Ruby was formulated in 1993 by Matsumoto, stemming from his desire for a genuine object-oriented, easy-to-use scripting language. Dissatisfied with existing languages like Perl and Python, which he felt were inadequate in their object-oriented features, Matsumoto envisioned Ruby as a simple Lisp-like language at its core, with an object system akin to Smalltalk, function blocks inspired by higher-order functions, and practical utility similar to Perl​​.\r\n\r\nThe name &amp;quot;Ruby&amp;quot; was chosen by Matsumoto during an online chat session in 1993 with Keiju Ishitsuka, before any code for the language was written. Initially, the names &amp;quot;Coral&amp;quot; and &amp;quot;Ruby&amp;quot; were considered, with &amp;quot;Ruby&amp;quot; being selected partly because it was the birthstone of one of Matsumoto&amp;#039;s colleagues. The first public release of Ruby, version 0.95, was in December 1995 on Japanese domestic newsgroups. This early version already featured many elements that define Ruby today, such as object-oriented design, classes with inheritance, mixins, iterators, closures, exception handling, and garbage collection','Maz','2023-11-14 07:42:00'),(19,'PHP','PHP, a general-purpose scripting language, is primarily designed for web development. Initially created in 1993 and released in 1995 by Danish-Canadian programmer Rasmus Lerdorf, PHP originally stood for &quot;Personal Home Page,&quot; but it was later redefined as a recursive initialism for &quot;PHP: Hypertext Preprocessor.&quot; The PHP code is processed on a web server by a PHP interpreter, which can be implemented as a module, a daemon, or a Common Gateway Interface (CGI) executable. The code execution results in various types of data, such as HTML or binary image data, forming part or all of an HTTP response. PHP also finds applications in tasks outside web contexts, like standalone graphical applications and robotic drone control, and can be executed directly from the command line​​.\r\n\r\nThe standard PHP interpreter is powered by the Zend Engine, a free software released under the PHP License. PHP&#039;s development lacked a formal written specification or standard until 2014; the original implementation served as a de facto standard. Since 2014, efforts have been made to establish a formal PHP specification. This widespread language can be deployed on most web servers across various operating systems and platforms​​.\r\n\r\nPHP&#039;s development began in 1993 when Rasmus Lerdorf wrote Common Gateway Interface (CGI) programs in C, which he used to maintain his personal homepage. This early version, named &quot;Personal Home Page/Forms Interpreter&quot; or PHP/FI, could build dynamic web applications and had basic features like Perl-like variables, form handling, and HTML embedding. The syntax was simpler, more limited, and less consistent than Perl. PHP/FI was not initially intended as a new programming language but evolved organically. PHP/FI 2, a more developed version, was officially released in November 1997 after extensive beta testing','Maz','2023-11-14 08:14:23');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14  2:22:09
