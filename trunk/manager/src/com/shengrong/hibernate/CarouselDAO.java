package com.shengrong.hibernate;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Carousel entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.shengrong.hibernate.Carousel
 * @author MyEclipse Persistence Tools
 */
public class CarouselDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CarouselDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String CONTENT = "content";

	public void save(Carousel transientInstance) {
		log.debug("saving Carousel instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Carousel persistentInstance) {
		log.debug("deleting Carousel instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Carousel findById(java.lang.Integer id) {
		log.debug("getting Carousel instance with id: " + id);
		try {
			Carousel instance = (Carousel) getSession().get(
					"com.shengrong.hibernate.Carousel", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Carousel instance) {
		log.debug("finding Carousel instance by example");
		try {
			List results = getSession()
					.createCriteria("com.shengrong.hibernate.Carousel")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Carousel instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Carousel as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findAll() {
		log.debug("finding all Carousel instances");
		try {
			String queryString = "from Carousel";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Carousel merge(Carousel detachedInstance) {
		log.debug("merging Carousel instance");
		try {
			Carousel result = (Carousel) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Carousel instance) {
		log.debug("attaching dirty Carousel instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Carousel instance) {
		log.debug("attaching clean Carousel instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}